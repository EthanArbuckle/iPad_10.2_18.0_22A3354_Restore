@implementation CUIThemePixelRendition

void __46___CUIThemePixelRendition_setSharedBlockData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t ImageProvider;
  os_unfair_lock_s *Info;
  id *v17;
  os_unfair_lock_s *v18;
  id WeakRetained;
  void *v20;
  unsigned int v21;
  NSString *v22;
  NSString *v24;
  unint64_t v25;
  NSString *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  _CUILog(3, (uint64_t)"CoreUI: dispatch_async to clear caches started", a3, a4, a5, a6, a7, a8, v34);
  v10 = *(int *)(a1 + 40);
  if (v10 > 2)
  {
    v13 = 0;
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *off_1E41B23B0[v10];
    v13 = *(_QWORD *)(v11 + v12);
    *(_QWORD *)(v11 + v12) = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 352))
      v14 = v13 == 0;
    else
      v14 = 1;
    if (!v14)
    {
      ImageProvider = CGImageGetImageProvider();
      Info = (os_unfair_lock_s *)CGImageProviderGetInfo(ImageProvider);
      if (Info)
      {
        v17 = (id *)Info;
        v18 = Info + 10;
        os_unfair_lock_lock(Info + 10);
        WeakRetained = objc_loadWeakRetained(v17 + 6);
        v20 = WeakRetained;
        if (WeakRetained)
        {
          if (*(_BYTE *)(v13 + 176))
          {
            v21 = objc_msgSend(WeakRetained, "bitmapEncoding");
            v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p-%d"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352), *(unsigned int *)(a1 + 40));
            if (v22)
            {
              if (v21 >= 2 && v21 <= 7)
              {
                v24 = v22;
                if (!objc_msgSend((id)+[_CSIRenditionBlockData sharedCache](), "objectForKey:", v22))
                {
                  v25 = *(_QWORD *)(v13 + 32) * *(unsigned int *)(v13 + 24);
                  if (v25 <= 0x17FEA3)
                  {
                    v26 = v24;
                    objc_msgSend((id)+[_CSIRenditionBlockData sharedCache](), "setObject:forKey:cost:", v13, v24, v25);
                    v27 = *(_DWORD *)(a1 + 40);
                    if (v27 == 2)
                    {

                      v17[13] = v24;
                    }
                    else if (v27 == 1)
                    {

                      v17[12] = v24;
                    }
                    else if (v27)
                    {

                    }
                    else
                    {

                      v17[11] = v24;
                    }
                  }
                }
              }
            }
          }
        }

        os_unfair_lock_unlock(v18);
      }
    }
  }

  _CUILog(3, (uint64_t)"CoreUI: dispatch_async to clear caches ended", v28, v29, v30, v31, v32, v33, a9);
}

NSDictionary *__77___CUIThemePixelRendition_newImageFromCSIDataSlice_ofBitmap_usingColorspace___block_invoke()
{
  NSDictionary *result;
  uint64_t v1;
  CFBooleanRef v2;
  uint64_t v3;
  CFBooleanRef v4;

  v3 = kCGImageProviderAlphaIsOne;
  v4 = kCFBooleanTrue;
  __opaqueProviderOptions = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
  v1 = kCGImageProviderAlphaIsPremultiplied;
  v2 = kCFBooleanTrue;
  result = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v2, &v1, 1);
  __nonOpaqueProviderOptions = (uint64_t)result;
  return result;
}

@end
