@implementation SLRequestMultiPartInputStream

- (SLRequestMultiPartInputStream)initWithMultiPart:(id)a3
{
  id v5;
  SLRequestMultiPartInputStream *v6;
  SLRequestMultiPartInputStream *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SLRequestMultiPartInputStream;
  v6 = -[SLRequestMultiPartInputStream init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_multiPart, a3);
    v7->_streamStatus = 0;
    -[SLRequestMultiPartInputStream transitionState](v7, "transitionState");
  }

  return v7;
}

- (void)transitionState
{
  uint64_t v2;
  NSData *v4;
  NSData *srcData;
  int v6;
  NSData *v7;
  NSData *v8;
  NSData *v9;
  NSData *v10;
  void *v11;
  void *v12;
  uint64_t currentState;

  self->_bytesReadInState = 0;
  -[SLRequestMultiPart uniqueIdentifier](self->_multiPart, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  currentState = self->_currentState;
  _SLLog(v2, 6, CFSTR("MultipartStream %@ transitioning from state %d"));

  switch(self->_currentState)
  {
    case 0:
      -[SLRequestMultiPart payloadPreamble](self->_multiPart, "payloadPreamble", v11, currentState);
      v4 = (NSData *)objc_claimAutoreleasedReturnValue();
      srcData = self->_srcData;
      self->_srcData = v4;

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_srcData, 4);
      _SLLog(v2, 6, CFSTR("Preamble for stream %@"));

      v6 = 1;
      goto LABEL_7;
    case 1:
      -[SLRequestMultiPart payload](self->_multiPart, "payload", v11, currentState);
      v7 = (NSData *)objc_claimAutoreleasedReturnValue();
      v8 = self->_srcData;
      self->_srcData = v7;

      v6 = 2;
      goto LABEL_7;
    case 2:
      -[SLRequestMultiPart payloadEpilogue](self->_multiPart, "payloadEpilogue", v11, currentState);
      v9 = (NSData *)objc_claimAutoreleasedReturnValue();
      v10 = self->_srcData;
      self->_srcData = v9;

      v6 = 3;
      goto LABEL_7;
    case 3:
      v6 = 4;
LABEL_7:
      self->_currentState = v6;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("MultipartInputStream in unexpected state"), v11, currentState);
      break;
  }
  -[SLRequestMultiPart uniqueIdentifier](self->_multiPart, "uniqueIdentifier", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v2, 6, CFSTR("MultipartStream %@ transitioned to state %d"));

}

- (unint64_t)readStateSourceData:(id)a3 toBuffer:(char *)a4 offset:(unint64_t)a5 maxLength:(unint64_t)a6
{
  uint64_t v6;
  id v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t bytesReadInState;
  void *v14;
  void *v16;
  NSRange v17;

  v10 = a3;
  v11 = self->_bytesReadInState + a6;
  if (v11 <= objc_msgSend(v10, "length"))
  {
    bytesReadInState = self->_bytesReadInState;
  }
  else
  {
    v12 = objc_msgSend(v10, "length");
    bytesReadInState = self->_bytesReadInState;
    a6 = v12 - bytesReadInState;
  }
  objc_msgSend(v10, "getBytes:range:", a4, bytesReadInState, a6);
  -[SLRequestMultiPart uniqueIdentifier](self->_multiPart, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.location = self->_bytesReadInState;
  v17.length = a6;
  NSStringFromRange(v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v6, 6, CFSTR("MultipartStream %@ read %u bytes in range %@ in state %d"));

  return a6;
}

- (int64_t)currentStateRead:(char *)a3 maxLength:(unint64_t)a4
{
  int64_t v5;
  unint64_t v6;

  v5 = -[SLRequestMultiPartInputStream readStateSourceData:toBuffer:offset:maxLength:](self, "readStateSourceData:toBuffer:offset:maxLength:", self->_srcData, a3, self->_bytesReadInState, a4);
  v6 = self->_bytesReadInState + v5;
  self->_bytesReadInState = v6;
  if (v6 == -[NSData length](self->_srcData, "length"))
    -[SLRequestMultiPartInputStream transitionState](self, "transitionState");
  return v5;
}

- (unint64_t)length
{
  return -[SLRequestMultiPart length](self->_multiPart, "length");
}

- (void)open
{
  self->_streamStatus = 2;
}

- (void)close
{
  self->_streamStatus = 6;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  if (self->_currentState == 4)
    return 0;
  else
    return -[SLRequestMultiPartInputStream currentStateRead:maxLength:](self, "currentStateRead:maxLength:", a3, a4);
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  return self->_currentState != 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srcData, 0);
  objc_storeStrong((id *)&self->_multiPart, 0);
}

@end
