@implementation VCPVideoMetaAnalyzer

+ (id)analyzerForTrackType:(id)a3 withTransform:(CGAffineTransform *)a4 requestAnalyses:(unint64_t)a5 formatDescription:(opaqueCMFormatDescription *)a6
{
  id v9;
  VCPVideoMetaFaceAnalyzer *v10;
  __int128 v11;
  VCPVideoMetaFaceAnalyzer *v12;
  __objc2_class **v13;
  __objc2_class **v14;
  VCPVideoMetaFaceAnalyzer *v15;
  _OWORD v17[3];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C8A958]))
  {
    v10 = [VCPVideoMetaFaceAnalyzer alloc];
    v11 = *(_OWORD *)&a4->c;
    v17[0] = *(_OWORD *)&a4->a;
    v17[1] = v11;
    v17[2] = *(_OWORD *)&a4->tx;
    v12 = -[VCPVideoMetaFaceAnalyzer initWithTransform:](v10, "initWithTransform:", v17);
LABEL_11:
    v15 = v12;
    goto LABEL_12;
  }
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C8A988]) & 1) != 0)
  {
    v13 = off_1E6B0FA88;
LABEL_5:
    v12 = (VCPVideoMetaFaceAnalyzer *)objc_alloc_init(*v13);
    goto LABEL_11;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("mdta/com.apple.quicktime.live-photo-info")) & 1) != 0)
  {
    v14 = off_1E6B0FA90;
LABEL_10:
    v12 = (VCPVideoMetaFaceAnalyzer *)objc_msgSend(objc_alloc(*v14), "initWithRequestAnalyses:formatDescription:", a5, a6);
    goto LABEL_11;
  }
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CA4CC0]) & 1) != 0)
  {
    v14 = off_1E6B0FA80;
    goto LABEL_10;
  }
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CA2588]))
  {
    v13 = &off_1E6B0FA98;
    goto LABEL_5;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("mdta/com.apple.quicktime.smartstyle-info")))
  {
    v14 = off_1E6B0FA78;
    goto LABEL_10;
  }
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] [VCPVideoMetaAnalyzer] Unknown analysis type %@", buf, 0xCu);
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4
{
  return -4;
}

- (int)finalizeAnalysis
{
  return 0;
}

- (NSDictionary)publicResults
{
  return 0;
}

- (NSDictionary)privateResults
{
  return 0;
}

- (float)photoOffset
{
  return self->_photoOffset;
}

- (void)setPhotoOffset:(float)a3
{
  self->_photoOffset = a3;
}

@end
