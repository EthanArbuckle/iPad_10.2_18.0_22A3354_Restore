@implementation BWStillImageCaptureDelegateCallbackInfo

- (BWStillImageCaptureDelegateCallbackInfo)initWithFlag:(unsigned int)a3 pts:(id *)a4 isPreBracketFrame:(BOOL)a5
{
  BWStillImageCaptureDelegateCallbackInfo *result;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWStillImageCaptureDelegateCallbackInfo;
  result = -[BWStillImageCaptureDelegateCallbackInfo init](&v10, sel_init);
  if (result)
  {
    result->_flag = a3;
    v9 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&result->_pts.flags = a4->var3;
    *(_OWORD *)(&result->_flag + 1) = v9;
    BYTE4(result->_pts.epoch) = a5;
    if ((a3 & (a3 - 1)) != 0)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("BWStillImageCaptureDelegateCallbackInfo can only be instantiated with one flag set"), 0));
  }
  return result;
}

- (BWStillImageCaptureDelegateCallbackInfo)initWithFlag:(unsigned int)a3
{
  __int128 v4;
  uint64_t v5;

  v4 = *MEMORY[0x1E0CA2E18];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  return -[BWStillImageCaptureDelegateCallbackInfo initWithFlag:pts:isPreBracketFrame:](self, "initWithFlag:pts:isPreBracketFrame:", *(_QWORD *)&a3, &v4, 0);
}

- (unsigned)flag
{
  return self->_flag;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pts
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  retstr->var3 = *(int64_t *)((char *)&self[1].var0 + 4);
  return self;
}

- (BOOL)isPreBracketFrame
{
  return BYTE4(self->_pts.epoch);
}

@end
