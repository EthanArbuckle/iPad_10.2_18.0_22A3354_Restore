@implementation FigCaptureSessionActiveCameraCaptureSource

- (id)initWithSource:(void *)a3 device:
{
  uint64_t v3;
  id v4;
  CFTypeRef v7;
  void (*v8)(const void *, const __CFString *, _QWORD, id *);
  id v9;
  int v11;
  uint64_t v12;
  id v13;
  objc_super v14;

  v4 = a1;
  if (a1)
  {
    if (!a2 || !a3)
    {
      v12 = v3;
      v11 = 0;
      FigDebugAssert3();
    }
    v14.receiver = v4;
    v14.super_class = (Class)FigCaptureSessionActiveCameraCaptureSource;
    v4 = objc_msgSendSuper2(&v14, sel_init, v11, v12);
    if (v4)
    {
      if (a2)
        v7 = CFRetain(a2);
      else
        v7 = 0;
      *((_QWORD *)v4 + 1) = v7;
      *((_QWORD *)v4 + 2) = a3;
      v13 = 0;
      v8 = *(void (**)(const void *, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 8)
                                                                                 + 48);
      if (v8)
      {
        v8(a2, CFSTR("AttributesDictionary"), *MEMORY[0x1E0C9AE00], &v13);
        v9 = v13;
      }
      else
      {
        v9 = 0;
      }
      *((_QWORD *)v4 + 3) = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NonLocalizedName")), "copy");
      *((_DWORD *)v4 + 8) = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("DeviceType")), "intValue");

    }
  }
  return v4;
}

- (void)dealloc
{
  OpaqueFigCaptureSource *source;
  objc_super v4;

  source = self->_source;
  if (source)
    CFRelease(source);

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureSessionActiveCameraCaptureSource;
  -[FigCaptureSessionActiveCameraCaptureSource dealloc](&v4, sel_dealloc);
}

@end
