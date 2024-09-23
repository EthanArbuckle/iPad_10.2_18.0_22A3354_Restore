@implementation DYMTLCommandQueueInfo

- (DYMTLCommandQueueInfo)initWithCommandQueue:(id)a3
{
  id v4;
  DYMTLCommandQueueInfo *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *label;
  NSString *displayName;
  DYMTLCommandQueueInfo *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DYMTLCommandQueueInfo;
  v5 = -[DYMTLCommandQueueInfo init](&v16, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "originalObject");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v6;
    }
    v8 = v7;

    objc_msgSend(v8, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deviceAddress = (unint64_t)v9;

    objc_msgSend(v8, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deviceStreamRef = objc_msgSend(v10, "streamReference");

    v5->_queueAddress = (unint64_t)v8;
    v5->_toolsQueueAddress = (unint64_t)v6;
    objc_msgSend(v8, "label");
    v11 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v11;

    displayName = v5->_displayName;
    v5->_displayName = 0;

    *(_WORD *)&v5->_canBeCaptured = 1;
    v5->_isInternalQueue = +[DYMTLCommandQueueInfo isLabelAppleInternal:](DYMTLCommandQueueInfo, "isLabelAppleInternal:", -[NSString UTF8String](v5->_label, "UTF8String"));
    v14 = v5;

  }
  return v5;
}

- (NSString)displayName
{
  NSString *label;
  NSString *v4;
  unint64_t toolsQueueAddress;
  NSString *displayName;

  if (!self->_displayName)
  {
    label = self->_label;
    if (label)
    {
      v4 = label;
    }
    else
    {
      toolsQueueAddress = self->_toolsQueueAddress;
      if (!toolsQueueAddress)
        toolsQueueAddress = self->_queueAddress;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Command Queue 0x%llx"), toolsQueueAddress);
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    displayName = self->_displayName;
    self->_displayName = v4;

  }
  return self->_displayName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYMTLCommandQueueInfo)initWithCoder:(id)a3
{
  id v4;
  DYMTLCommandQueueInfo *v5;
  uint64_t v6;
  NSString *label;
  DYMTLCommandQueueInfo *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DYMTLCommandQueueInfo;
  v5 = -[DYMTLCommandQueueInfo init](&v10, sel_init);
  if (v5)
  {
    v5->_streamRef = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("streamRef"));
    v5->_deviceAddress = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deviceAddress"));
    v5->_deviceStreamRef = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deviceStreamRef"));
    v5->_queueAddress = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("queueAddress"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_canBeCaptured = 1;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("canBeCaptured")))
      v5->_canBeCaptured = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canBeCaptured"));
    v5->_isOpenGLQueue = 0;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("isOpenGLQueue")))
      v5->_isOpenGLQueue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOpenGLQueue"));
    v5->_isInternalQueue = 0;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("isInternalQueue")))
      v5->_isInternalQueue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isInternalQueue"));
    v5->_toolsQueueAddress = 0;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("toolsQueueAddress")))
      v5->_toolsQueueAddress = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("toolsQueueAddress"));
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_streamRef, CFSTR("streamRef"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_deviceAddress, CFSTR("deviceAddress"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_deviceStreamRef, CFSTR("deviceStreamRef"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_queueAddress, CFSTR("queueAddress"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_toolsQueueAddress, CFSTR("toolsQueueAddress"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_canBeCaptured, CFSTR("canBeCaptured"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isOpenGLQueue, CFSTR("isOpenGLQueue"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isInternalQueue, CFSTR("isInternalQueue"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;

  v4 = (_QWORD *)objc_opt_new();
  v5 = v4;
  if (v4)
  {
    v4[3] = self->_streamRef;
    v4[4] = self->_deviceAddress;
    v4[5] = self->_deviceStreamRef;
    v4[6] = self->_queueAddress;
    v4[7] = self->_toolsQueueAddress;
    v6 = -[NSString copy](self->_label, "copy");
    v7 = (void *)v5[8];
    v5[8] = v6;

    *((_BYTE *)v5 + 8) = self->_canBeCaptured;
    *((_BYTE *)v5 + 9) = self->_isOpenGLQueue;
    *((_BYTE *)v5 + 10) = self->_isInternalQueue;
    v8 = v5;
  }

  return v5;
}

- (NSString)description
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;

  v2 = CFSTR("YES");
  if (self->_canBeCaptured)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (self->_isOpenGLQueue)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (!self->_isInternalQueue)
    v2 = CFSTR("NO");
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("device:0x%llx, queue:0x%llx, toolsQueue:0x%llx, label:%@, canBeCaptured:%@, isOpenGL:%@, isInternal: %@"), self->_deviceAddress, self->_queueAddress, self->_toolsQueueAddress, self->_label, v3, v4, v2);
}

+ (id)capturableObjectType
{
  return (id)*MEMORY[0x24BE39290];
}

- (NSString)capturableObjectType
{
  return (NSString *)(id)*MEMORY[0x24BE39290];
}

+ (BOOL)isLabelAppleInternal:(const char *)a3
{
  size_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  int v8;

  {
    if (a3)
      goto LABEL_3;
LABEL_7:
    LOBYTE(v5) = 0;
    return v5;
  }
  +[DYMTLCommandQueueInfo isLabelAppleInternal:]::kPrefixLength = 1;
  if (!a3)
    goto LABEL_7;
LABEL_3:
  if (+[DYMTLCommandQueueInfo isLabelAppleInternal:]::kPrefixLength)
    v4 = 9;
  else
    v4 = 0;
  if (strncmp("com.apple", a3, v4))
    goto LABEL_7;
  v5 = strcmp(a3, "com.apple.SceneKit");
  if (v5)
  {
    v6 = 0;
    do
    {
      v7 = v6;
      if (v6 == 4)
        break;
      v8 = strcmp(a3, +[DYMTLCommandQueueInfo isLabelAppleInternal:]::kWhitelistedLabels[v6 + 1]);
      v6 = v7 + 1;
    }
    while (v8);
    LOBYTE(v5) = v7 > 3;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v5 == objc_opt_class() && self->_queueAddress == v4[6];

  return v6;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (unint64_t)deviceAddress
{
  return self->_deviceAddress;
}

- (unint64_t)deviceStreamRef
{
  return self->_deviceStreamRef;
}

- (unint64_t)queueAddress
{
  return self->_queueAddress;
}

- (unint64_t)toolsQueueAddress
{
  return self->_toolsQueueAddress;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)canBeCaptured
{
  return self->_canBeCaptured;
}

- (void)setCanBeCaptured:(BOOL)a3
{
  self->_canBeCaptured = a3;
}

- (BOOL)isOpenGLQueue
{
  return self->_isOpenGLQueue;
}

- (void)setIsOpenGLQueue:(BOOL)a3
{
  self->_isOpenGLQueue = a3;
}

- (BOOL)isInternalQueue
{
  return self->_isInternalQueue;
}

- (void)setIsInternalQueue:(BOOL)a3
{
  self->_isInternalQueue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
