@implementation STKAnimatedStickerUtilities

+ (id)downSampledHeicsDataFromData:(id)a3 maxLength:(unint64_t)a4
{
  id v4;
  void *v5;
  id v6;
  const void *v8;
  void *v9;
  void *Value;
  id v11;
  CFTypeRef v12[2];
  uint64_t v13;
  uint64_t v14;
  CFTypeRef arg;
  CFTypeRef v16[2];
  CFTypeRef v17[10];

  v17[8] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  arg = 0;
  v4 = a3;
  v17[0] = 0;
  if (CMPhotoDecompressionSessionCreate()
    || (CFAutorelease(v17[0]), v16[0] = 0, CMPhotoDecompressionSessionCreateContainer())
    || (CFAutorelease(v16[0]), CMPhotoDecompressionContainerCreateSequenceContainer()))
  {

LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  CFAutorelease(arg);

  v13 = 0;
  v14 = 0;
  v12[0] = 0;
  if (CMPhotoCompressionSessionCreate())
    goto LABEL_5;
  CFAutorelease(v12[0]);
  v8 = (const void *)*MEMORY[0x24BE12030];
  v16[0] = *(CFTypeRef *)MEMORY[0x24BE12038];
  v16[1] = v8;
  v17[0] = &unk_2505F9970;
  v17[1] = &unk_2505F9988;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (CMPhotoCompressionSessionOpenEmptyContainer()
    || CMPhotoCompressionSessionStartImageSequence()
    || CMPhotoDecompressionContainerGetImageCountWithOptions()
    || CMPhotoDecompressionContainerCreateDictionaryDescription())
  {

    goto LABEL_5;
  }
  CFAutorelease(0);
  Value = (void *)CFDictionaryGetValue(0, (const void *)*MEMORY[0x24BE120F0]);

  v11 = Value;
  if (CMPhotoCompressionSessionEndImageSequence()
    || (v12[0] = 0, CMPhotoCompressionSessionCloseContainerAndCopyBacking()))
  {
    v5 = 0;
  }
  else
  {
    v5 = (id)v12[0];
  }

LABEL_6:
  v6 = v5;

  return v6;
}

@end
