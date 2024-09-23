@implementation AVVirtualCaptureCard

+ (id)sharedVirtualCaptureCard
{
  if (sharedVirtualCaptureCard_onceToken != -1)
    dispatch_once(&sharedVirtualCaptureCard_onceToken, &__block_literal_global_8);
  return (id)sharedVirtualCaptureCard_sAVVirtualCaptureCard;
}

AVVirtualCaptureCard *__48__AVVirtualCaptureCard_sharedVirtualCaptureCard__block_invoke()
{
  AVVirtualCaptureCard *result;

  result = objc_alloc_init(AVVirtualCaptureCard);
  sharedVirtualCaptureCard_sAVVirtualCaptureCard = (uint64_t)result;
  return result;
}

+ (BOOL)isVirtualCaptureCardSupported
{
  return FigVirtualCaptureCardRemoteSupported() != 0;
}

+ (void)initialize
{
  objc_opt_class();
}

- (AVVirtualCaptureCard)init
{
  AVVirtualCaptureCard *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVVirtualCaptureCard;
  v2 = -[AVVirtualCaptureCard init](&v4, sel_init);
  if (v2 && FigVirtualCaptureCardRemoteCreate())
  {

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  OpaqueFigVirtualCaptureCard *virtualCaptureCard;
  objc_super v4;

  virtualCaptureCard = self->_virtualCaptureCard;
  if (virtualCaptureCard)
    CFRelease(virtualCaptureCard);
  v4.receiver = self;
  v4.super_class = (Class)AVVirtualCaptureCard;
  -[AVVirtualCaptureCard dealloc](&v4, sel_dealloc);
}

- (void)showSystemUserInterface
{
  OpaqueFigVirtualCaptureCard *virtualCaptureCard;
  void (*v3)(OpaqueFigVirtualCaptureCard *);

  virtualCaptureCard = self->_virtualCaptureCard;
  v3 = *(void (**)(OpaqueFigVirtualCaptureCard *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v3)
    v3(virtualCaptureCard);
}

- (int64_t)capacity
{
  uint64_t CMBaseObject;
  uint64_t (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v4;
  CFTypeRef v5;
  int64_t SInt64;
  CFTypeRef cf;

  cf = 0;
  CMBaseObject = FigVirtualCaptureCardGetCMBaseObject();
  v3 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3)
    return 0;
  v4 = v3(CMBaseObject, *MEMORY[0x1E0CA5470], *MEMORY[0x1E0C9AE00], &cf);
  v5 = cf;
  if (v4)
  {
    SInt64 = 0;
    if (!cf)
      return SInt64;
    goto LABEL_4;
  }
  SInt64 = FigCFNumberGetSInt64();
  v5 = cf;
  if (cf)
LABEL_4:
    CFRelease(v5);
  return SInt64;
}

- (int64_t)freeSpace
{
  uint64_t CMBaseObject;
  uint64_t (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v4;
  CFTypeRef v5;
  int64_t SInt64;
  CFTypeRef cf;

  cf = 0;
  CMBaseObject = FigVirtualCaptureCardGetCMBaseObject();
  v3 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3)
    return 0;
  v4 = v3(CMBaseObject, *MEMORY[0x1E0CA5478], *MEMORY[0x1E0C9AE00], &cf);
  v5 = cf;
  if (v4)
  {
    SInt64 = 0;
    if (!cf)
      return SInt64;
    goto LABEL_4;
  }
  SInt64 = FigCFNumberGetSInt64();
  v5 = cf;
  if (cf)
LABEL_4:
    CFRelease(v5);
  return SInt64;
}

- (BOOL)setCapacity:(int64_t)a3 error:(id *)a4
{
  CFNumberRef v5;
  uint64_t CMBaseObject;
  uint64_t (*v7)(uint64_t, _QWORD, CFNumberRef);
  int v8;
  int64_t valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, &valuePtr);
  CMBaseObject = FigVirtualCaptureCardGetCMBaseObject();
  v7 = *(uint64_t (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v7)
  {
    v8 = v7(CMBaseObject, *MEMORY[0x1E0CA5470], v5);
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    v8 = -12782;
    if (!a4)
      goto LABEL_7;
  }
  if (v8)
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v8, 0);
LABEL_7:
  if (v5)
    CFRelease(v5);
  return v8 == 0;
}

@end
