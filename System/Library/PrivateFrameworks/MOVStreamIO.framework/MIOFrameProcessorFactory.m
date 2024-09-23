@implementation MIOFrameProcessorFactory

+ (id)processorForConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4
{
  id v5;
  uint64_t MediaSubType;
  void *v7;
  int v8;
  unsigned int v9;
  BOOL v10;
  void *v11;
  char v12;
  __objc2_class **v13;
  __objc2_class **v14;
  BOOL v15;
  void *v16;

  v5 = a3;
  MediaSubType = CMFormatDescriptionGetMediaSubType(a4);
  objc_msgSend(v5, "objectForKey:", CFSTR("StreamEncoderType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  v9 = v8 & 0xFFFFFFFE;
  v10 = (v8 & 0xFFFFFFFE) != 6 || (_DWORD)MediaSubType == 1278226488;
  if (v10
    || (objc_msgSend(v5, "objectForKey:", CFSTR("StreamConvertNonPlanarBuffersTo8bitMonochrome")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "BOOLValue"),
        v11,
        (v12 & 1) == 0))
  {
    if (+[MIOPixelBufferUtility isPixelFormatRawBayer:](PixelBufferUtility, "isPixelFormatRawBayer:", MediaSubType))
    {
      v13 = off_24CA43BD0;
      v14 = off_24CA43B90;
      v15 = v8 == 14;
    }
    else
    {
      if ((_DWORD)MediaSubType == 1278226738 && v8 == 14)
      {
        v13 = off_24CA43B90;
        goto LABEL_20;
      }
      if (+[MIOPixelBufferUtility isPixelFormatCompandedRawBayer:](PixelBufferUtility, "isPixelFormatCompandedRawBayer:", MediaSubType))
      {
        v13 = off_24CA43B20;
        goto LABEL_20;
      }
      if ((_DWORD)MediaSubType == 1278226742 && v9 == 4)
      {
        v13 = off_24CA43B68;
        goto LABEL_20;
      }
      v15 = v9 == 4 && (_DWORD)MediaSubType == 1899524402;
      v13 = off_24CA43B28;
      v14 = off_24CA43C40;
    }
    if (v15)
      v13 = v14;
  }
  else
  {
    v13 = off_24CA43BA0;
  }
LABEL_20:
  v16 = (void *)objc_msgSend(objc_alloc(*v13), "initWithInputFormatDescription:", a4);

  return v16;
}

@end
