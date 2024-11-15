@implementation IMTranscoderImageCMPhotoSizeEstimator

- (IMTranscoderImageCMPhotoSizeEstimator)initWithURL:(id)a3 uti:(id)a4 imageSource:(CGImageSource *)a5
{
  IMTranscoderImageCMPhotoSizeEstimator *v5;
  int Container;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMTranscoderImageCMPhotoSizeEstimator;
  v5 = -[IMTranscoderImageSizeEstimator initWithUTI:imageSource:](&v8, sel_initWithUTI_imageSource_, a4, a5);
  if (CMPhotoDecompressionSessionCreate()
    || (Container = CMPhotoDecompressionSessionCreateContainer(), CFRelease(0), Container))
  {

    return 0;
  }
  else
  {
    v5->_container = 0;
  }
  return v5;
}

- (void)dealloc
{
  CMPhotoDecompressionContainer *container;
  objc_super v4;

  container = self->_container;
  if (container)
    CFRelease(container);
  v4.receiver = self;
  v4.super_class = (Class)IMTranscoderImageCMPhotoSizeEstimator;
  -[IMTranscoderImageCMPhotoSizeEstimator dealloc](&v4, sel_dealloc);
}

- (unint64_t)optimizedEstimatedSizeForOutputUTI:(id)a3 maximumDimension:(int64_t)a4 quality:(double)a5
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  _QWORD v38[5];

  v38[4] = *MEMORY[0x24BDAC8D0];
  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x24BDC17C0]))
    v12 = 1785750887;
  else
    v12 = 1752589105;
  v37[0] = *MEMORY[0x24BE12108];
  v38[0] = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v7, a4, v8, v9, v10, v11, 0);
  v37[1] = *MEMORY[0x24BE12050];
  v18 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v13, v12, v14, v15, v16, v17);
  v19 = *MEMORY[0x24BE12098];
  v38[1] = v18;
  v38[2] = &unk_24E202970;
  v20 = *MEMORY[0x24BE12090];
  v37[2] = v19;
  v37[3] = v20;
  v35 = *MEMORY[0x24BE12140];
  v36 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v21, v22, v23, v24, v25, v26, a5);
  v38[3] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)&v36, (uint64_t)&v35, 1, v28, v29);
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v30, (uint64_t)v38, (uint64_t)v37, 4, v31, v32);
  if (CMPhotoDecompressionContainerPredictTranscodedSize())
    return 0;
  else
    return (unint64_t)(double)v34;
}

- (unint64_t)estimatedSizeForOutputUTI:(id)a3 maximumDimension:(int64_t)a4 quality:(double)a5
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  objc_super v14;

  if (!UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x24BDC17C0])
    && !UTTypeConformsTo((CFStringRef)a3, CFSTR("public.heif-standard"))
    || (result = objc_msgSend_optimizedEstimatedSizeForOutputUTI_maximumDimension_quality_(self, v9, (uint64_t)a3, a4, v10, v11, v12, a5)) == 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)IMTranscoderImageCMPhotoSizeEstimator;
    return -[IMTranscoderImageSizeEstimator estimatedSizeForOutputUTI:maximumDimension:quality:](&v14, sel_estimatedSizeForOutputUTI_maximumDimension_quality_, a3, a4, a5);
  }
  return result;
}

@end
