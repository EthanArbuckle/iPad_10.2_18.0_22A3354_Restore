@implementation AVCaptureGetTransformedDetectedObjectsInfo

uint64_t __AVCaptureGetTransformedDetectedObjectsInfo_block_invoke(uint64_t a1, void *a2, const __CFDictionary *a3)
{
  CGSize v6;
  __int128 v7;
  CFDictionaryRef DictionaryRepresentation;
  double v9;
  double v10;
  double v11;
  uint64_t result;
  double v13;
  CGAffineTransform v14;
  CGRect rect;

  if (objc_msgSend(a2, "hasSuffix:", CFSTR("Rect")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      rect.size = v6;
      if (CGRectMakeWithDictionaryRepresentation(a3, &rect))
      {
        v7 = *(_OWORD *)(a1 + 56);
        *(_OWORD *)&v14.a = *(_OWORD *)(a1 + 40);
        *(_OWORD *)&v14.c = v7;
        *(_OWORD *)&v14.tx = *(_OWORD *)(a1 + 72);
        rect = CGRectApplyAffineTransform(rect, &v14);
        DictionaryRepresentation = CGRectCreateDictionaryRepresentation(rect);
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", DictionaryRepresentation, a2);

      }
    }
  }
  if (objc_msgSend(a2, "hasSuffix:", CFSTR("Roll")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[__CFDictionary doubleValue](a3, "doubleValue");
      v10 = v9 + *(double *)(a1 + 88);
      if (*(_BYTE *)(a1 + 96))
        v10 = -v10;
      v11 = 360.0;
      if (v10 >= 360.0)
      {
        v11 = -360.0;
      }
      else if (v10 >= 0.0)
      {
        goto LABEL_14;
      }
      v10 = v10 + v11;
LABEL_14:
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10), a2);
    }
  }
  result = objc_msgSend(a2, "hasSuffix:", CFSTR("Yaw"));
  if ((_DWORD)result)
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      -[__CFDictionary doubleValue](a3, "doubleValue");
      if (*(_BYTE *)(a1 + 96))
      {
        if (v13 <= 0.0)
          v13 = -v13;
        else
          v13 = 360.0 - v13;
      }
      return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13), a2);
    }
  }
  return result;
}

@end
