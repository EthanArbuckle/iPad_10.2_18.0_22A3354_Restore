@implementation HMIHTMLReport

- (HMIHTMLReport)initWithTitle:(id)a3 outputPath:(id)a4
{
  id v6;
  id v7;
  HMIHTMLReport *v8;
  HMIHTMLReport *v9;
  uint64_t v10;
  NSOutputStream *stream;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMIHTMLReport;
  v8 = -[HMIHTMLReport init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_outputPath, a4);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF08]), "initToFileAtPath:append:", v7, 0);
    stream = v9->_stream;
    v9->_stream = (NSOutputStream *)v10;

    -[HMIHTMLReport stream](v9, "stream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "open");

    -[HMIHTMLReport appendHeaderWithTitle:textColor:backgroundColor:](v9, "appendHeaderWithTitle:textColor:backgroundColor:", v6, CFSTR("#ffffff"), CFSTR("#000000"));
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HMIHTMLReport appendString:](self, "appendString:", CFSTR("</body>\n</html>"));
  -[HMIHTMLReport stream](self, "stream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "close");

  -[HMIHTMLReport outputPath](self, "outputPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Visualizer saved (%@)"), v4);

  v5.receiver = self;
  v5.super_class = (Class)HMIHTMLReport;
  -[HMIHTMLReport dealloc](&v5, sel_dealloc);
}

- (id)_loadResource:(id)a3 withExtension:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLForResource:withExtension:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v10, 4);

  return v11;
}

- (void)appendHeaderWithTitle:(id)a3 textColor:(id)a4 backgroundColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMIHTMLReport _loadResource:withExtension:](self, "_loadResource:withExtension:", CFSTR("HMIHTMLReport"), CFSTR("css"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[HMIHTMLReport _loadResource:withExtension:](self, "_loadResource:withExtension:", CFSTR("HMIHTMLReport"), CFSTR("js"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<html>\n<head><title>%@</title></head>\n<style>\n%@\n</style>\n<body text='%@' bgcolor='%@'>\n<script>\n%@\n</script>\n"), v10, v13, v9, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMIHTMLReport appendString:](self, "appendString:", v12);
}

- (void)appendString:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIHTMLReport stream](self, "stream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "write:maxLength:", objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

}

- (void)appendText:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<br>\n"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMIHTMLReport appendString:](self, "appendString:", v4);

}

- (void)appendFrame:(id)a3 text:(id)a4
{
  -[HMIHTMLReport appendFrame:text:boxes:imageBorder:imageColor:outlineBorder:outlineColor:](self, "appendFrame:text:boxes:imageBorder:imageColor:outlineBorder:outlineColor:", a3, a4, MEMORY[0x24BDBD1A8], 0, &stru_24DBF1B40);
}

- (void)appendFrame:(id)a3 text:(id)a4 boxes:(id)a5 imageBorder:(int)a6 imageColor:(id)a7 outlineBorder:(int)a8 outlineColor:(id)a9
{
  uint64_t v9;
  uint64_t v11;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  float v33;
  float v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  _QWORD v44[5];
  float v45;
  float v46;
  id v47;

  v9 = *(_QWORD *)&a8;
  v11 = *(_QWORD *)&a6;
  v43 = a4;
  v15 = a7;
  v16 = a9;
  v17 = a5;
  v18 = a3;
  objc_msgSend(v18, "size");
  v20 = v19;
  objc_msgSend(v18, "size");
  if (v20 >= v21)
    v22 = v20;
  else
    v22 = v21;
  v23 = 480.0 / v22;
  if (v23 > 1.0)
    v23 = 1.0;
  v24 = fmax(v23, 0.0);
  v25 = v24;
  objc_msgSend(v18, "size");
  v27 = v26 * v25;
  objc_msgSend(v18, "size");
  v29 = v28 * v25;
  v47 = 0;
  objc_msgSend(v18, "compressedFrameWithScale:quality:error:", &v47, v25, 1.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v47;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)v11 >= 1)
  {
    if (objc_msgSend(v15, "length"))
    {
      if (!objc_msgSend(v15, "length"))
        goto LABEL_12;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("border:%dpx solid %@;"), v11, v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("border:%dpx;"), v11, v41);
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v32);

  }
LABEL_12:
  v33 = v27;
  if ((int)v9 < 1)
    goto LABEL_18;
  if (objc_msgSend(v16, "length"))
  {
    if (!objc_msgSend(v16, "length"))
      goto LABEL_18;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("outline:%dpx solid %@;"), v9, v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("outline:%dpx;"), v9, v41);
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v35);

LABEL_18:
  v36 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v30, "base64Encoded");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "componentsJoinedByString:", CFSTR(" "));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v29;
  objc_msgSend(v36, "stringWithFormat:", CFSTR("<div class='image'>\n<img width='%d' height='%d' src='data:image/jpeg;base64,%@' style='%@'/>\n"),
    (int)v33,
    (int)v34,
    v37,
    v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIHTMLReport appendString:](self, "appendString:", v39);

  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __90__HMIHTMLReport_appendFrame_text_boxes_imageBorder_imageColor_outlineBorder_outlineColor___block_invoke;
  v44[3] = &unk_24DBE9AD0;
  v44[4] = self;
  v45 = v29;
  v46 = v33;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v44);

  if (objc_msgSend(v43, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<div class=\"text\">%@</div>\n"), v43);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIHTMLReport appendString:](self, "appendString:", v40);

  }
  -[HMIHTMLReport appendString:](self, "appendString:", CFSTR("</div>\n"));

}

void __90__HMIHTMLReport_appendFrame_text_boxes_imageBorder_imageColor_outlineBorder_outlineColor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  float v14;
  double v15;
  float v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a2;
  objc_msgSend(v5, "boundingBox");
  v7 = (int)(v6 * *(float *)(a1 + 40));
  objc_msgSend(v5, "boundingBox");
  v9 = (int)(v8 * *(float *)(a1 + 44));
  objc_msgSend(v5, "boundingBox");
  v11 = (int)(v10 * *(float *)(a1 + 44));
  objc_msgSend(v5, "boundingBox");
  v13 = (int)(v12 * *(float *)(a1 + 40));
  objc_msgSend(v5, "color");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "opacity");
  v15 = v14;
  objc_msgSend(v5, "value");
  v17 = v16;
  objc_msgSend(v5, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithFormat:", CFSTR("<div class='rect' style='top:%dpx; left:%dpx; width:%dpx; height:%dpx; border-color:%@; opacity:%.1f' threshold='%.3f'>%@</div>\n"),
    v7,
    v9,
    v11,
    v13,
    v20,
    *(_QWORD *)&v15,
    *(_QWORD *)&v17,
    v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v19);

}

- (void)appendFaceCrop:(id)a3 imageBorder:(int)a4 imageColor:(id)a5 outlineBorder:(int)a6 outlineColor:(id)a7
{
  uint64_t v7;
  uint64_t v9;
  id v12;
  id v13;
  id v14;

  v7 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a4;
  v12 = a7;
  v13 = a5;
  objc_msgSend(a3, "dataRepresentation");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[HMIHTMLReport appendJPEG:imageBorder:imageColor:outlineBorder:outlineColor:](self, "appendJPEG:imageBorder:imageColor:outlineBorder:outlineColor:", v14, v9, v13, v7, v12);

}

- (void)appendJPEG:(id)a3 imageBorder:(int)a4 imageColor:(id)a5 outlineBorder:(int)a6 outlineColor:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  __CVBuffer *v15;
  double Size;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  float v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a4;
  v12 = a5;
  v13 = a7;
  v31 = 0;
  v14 = a3;
  v15 = +[HMIVisionUtilities createPixelBufferFromJPEGData:error:](HMIVisionUtilities, "createPixelBufferFromJPEGData:error:", v14, &v31);
  Size = HMICVPixelBufferGetSize(v15);
  v18 = v17;
  CVPixelBufferRelease(v15);
  objc_msgSend(v14, "base64EncodedStringWithOptions:", 32);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)v9 >= 1)
  {
    if (objc_msgSend(v12, "length"))
    {
      if (!objc_msgSend(v12, "length"))
        goto LABEL_7;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("border:%dpx solid %@;"), v9, v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("border:%dpx;"), v9, v30);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v21);

  }
LABEL_7:
  if ((int)v8 >= 1)
  {
    if (!objc_msgSend(v13, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("outline:%dpx;"), v8, v30);
      goto LABEL_12;
    }
    if (objc_msgSend(v13, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("outline:%dpx solid %@;"), v8, v13);
LABEL_12:
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v22);

    }
  }
  v23 = v18;
  v24 = Size;
  v25 = (void *)MEMORY[0x24BDD17C8];
  v26 = (int)v24;
  v27 = (int)v23;
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR(" "));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("<div class='image'>\n<img width='%d' height='%d' src='data:image/jpeg;base64,%@' style='%@'/>\n"),
    v26,
    v27,
    v19,
    v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIHTMLReport appendString:](self, "appendString:", v29);

  -[HMIHTMLReport appendString:](self, "appendString:", CFSTR("</div>\n"));
}

- (void)appendFragmentResult:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "frameResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__HMIHTMLReport_appendFragmentResult___block_invoke;
  v5[3] = &unk_24DBE9AF8;
  v5[4] = self;
  objc_msgSend(v4, "na_each:", v5);

}

void __38__HMIHTMLReport_appendFragmentResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  float Seconds;
  void *v7;
  CMTime time;

  v3 = a2;
  objc_msgSend(v3, "frame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "presentationTimeStamp");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.3fs"), Seconds);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendFrameResult:frameTruth:description:", v3, 0, v7);

}

- (void)appendFragmentResult:(id)a3 assetPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIVideoFragment *v9;
  HMIVideoFrameGenerator *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  HMIHTMLReport *v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMIVideoFragment initWithData:]([HMIVideoFragment alloc], "initWithData:", v8);
  v10 = -[HMIVideoFrameGenerator initWithVideoFragment:]([HMIVideoFrameGenerator alloc], "initWithVideoFragment:", v9);
  objc_msgSend(v6, "frameResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_map:", &__block_literal_global);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __48__HMIHTMLReport_appendFragmentResult_assetPath___block_invoke_2;
  v20 = &unk_24DBE9B88;
  v21 = v6;
  v22 = v12;
  v23 = v7;
  v24 = self;
  v13 = v7;
  v14 = v12;
  v15 = v6;
  v16 = (void *)MEMORY[0x220735744](&v17);
  -[HMIVideoFrameGenerator generateVideoFramesForTimes:completionHandler:](v10, "generateVideoFramesForTimes:completionHandler:", v14, v16, v17, v18, v19, v20);

}

id __48__HMIHTMLReport_appendFragmentResult_assetPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v2 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(a2, "frame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "presentationTimeStamp");
  else
    memset(v7, 0, sizeof(v7));
  objc_msgSend(v2, "valueWithCMTime:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __48__HMIHTMLReport_appendFragmentResult_assetPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__HMIHTMLReport_appendFragmentResult_assetPath___block_invoke_3;
  v6[3] = &unk_24DBE9B60;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v9 = v4;
  v10 = v5;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v6);

}

void __48__HMIHTMLReport_appendFragmentResult_assetPath___block_invoke_3(id *a1, void *a2, uint64_t a3)
{
  id v5;
  HMIVideoAnalyzerFrameResult *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMIVideoAnalyzerFrameResult *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CMTime time;

  v5 = a2;
  v6 = [HMIVideoAnalyzerFrameResult alloc];
  objc_msgSend(a1[4], "frameResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "events");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "frameResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "regionOfInterest");
  v12 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v6, "initWithFrame:events:regionOfInterest:", v5, v9);

  v13 = (void *)MEMORY[0x24BDD17C8];
  v14 = objc_msgSend(a1[5], "count");
  objc_msgSend(a1[6], "lastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v5, "presentationTimeStamp");
  else
    memset(&time, 0, sizeof(time));
  objc_msgSend(v13, "stringWithFormat:", CFSTR("[%lu/%lu] %@ (%.2fs)"), a3, v14, v15, CMTimeGetSeconds(&time));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[7], "appendFrameResult:frameTruth:description:", v12, 0, v16);
}

- (void)appendFrameResult:(id)a3 frameTruth:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];
  CGRect v28;

  v27[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x24BDBCEB8];
  v11 = a5;
  objc_msgSend(v10, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  if (v9)
  {
    objc_msgSend(v9, "events");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __58__HMIHTMLReport_appendFrameResult_frameTruth_description___block_invoke;
    v25[3] = &unk_24DBE9BB0;
    v26 = v12;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v25);

  }
  objc_msgSend(v8, "regionOfInterest");
  if (!CGRectIsEmpty(v28))
  {
    objc_msgSend(v8, "regionOfInterest");
    +[HMIHTMLReport boxForRegionOfInterest:](HMIHTMLReport, "boxForRegionOfInterest:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v15);

  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("confidence.value"), 1);
  objc_msgSend(v8, "events");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sortedArrayUsingDescriptors:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __58__HMIHTMLReport_appendFrameResult_frameTruth_description___block_invoke_2;
  v23[3] = &unk_24DBE9BD8;
  v24 = v12;
  v21 = v12;
  objc_msgSend(v20, "na_each:", v23);
  objc_msgSend(v8, "frame");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIHTMLReport appendFrame:text:boxes:imageBorder:imageColor:outlineBorder:outlineColor:](self, "appendFrame:text:boxes:imageBorder:imageColor:outlineBorder:outlineColor:", v22, v11, v21, 0, &stru_24DBF1B40);

}

void __58__HMIHTMLReport_appendFrameResult_frameTruth_description___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[HMIHTMLReport boxesForEvent:isTruth:](HMIHTMLReport, "boxesForEvent:isTruth:", a2, 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

void __58__HMIHTMLReport_appendFrameResult_frameTruth_description___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[HMIHTMLReport boxesForEvent:isTruth:](HMIHTMLReport, "boxesForEvent:isTruth:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

+ (id)boxesForEvent:(id)a3 isTruth:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  float v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HMIHTMLReportBox *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  HMIHTMLReportBox *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  BOOL IsEmpty;
  void *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  HMIHTMLReportBox *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  HMIHTMLReportBox *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  BOOL v74;
  void *v75;
  HMIHTMLReportBox *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  __CFString *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  HMIHTMLReportBox *v92;
  void *v93;
  void *v95;
  void *v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  v7 = a4;
  v8 = a3;
  if (v7)
    v9 = 0.4;
  else
    v9 = 1.0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v11, "boundingBox");
  if (!CGRectIsEmpty(v97))
  {
    if (v7)
    {
      v14 = &stru_24DBF1B40;
    }
    else
    {
      if (v13 && (objc_msgSend(v13, "sessionEntityUUID"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v16 = v15;
        objc_msgSend(v15, "UUIDString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "substringToIndex:", 3);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = &stru_24DBF1B40;
      }
      v19 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v11, "confidence");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "value");
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%.3f %@"), v21, v18);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v22 = [HMIHTMLReportBox alloc];
    objc_msgSend(v11, "boundingBox");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    +[HMIVideoAnalyzerEvent rgbColorCodeForEventClass:](HMIVideoAnalyzerEvent, "rgbColorCodeForEventClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      LODWORD(v33) = 1.0;
    }
    else
    {
      objc_msgSend(v11, "confidence");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      *(float *)&v33 = v34;
    }
    *(float *)&v32 = v9;
    v35 = -[HMIHTMLReportBox initWithBoundingBox:text:color:opacity:value:](v22, "initWithBoundingBox:text:color:opacity:value:", v14, v31, v24, v26, v28, v30, v32, v33);
    objc_msgSend(v10, "addObject:", v35);

    if (!v7)
  }
  if (v13)
  {
    objc_msgSend(v13, "face");
    v36 = objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = (void *)v36;
      objc_msgSend(v13, "face");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "boundingBox");
      IsEmpty = CGRectIsEmpty(v98);

      if (!IsEmpty)
      {
        objc_msgSend(v13, "face");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v41 = &stru_24DBF1B40;
        }
        else
        {
          objc_msgSend(v13, "face");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "faceRecognition");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "classifications");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = (void *)objc_msgSend(v44, "hmf_isEmpty");

          if ((_DWORD)v5)
          {
            v45 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v40, "confidence");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "value");
            objc_msgSend(v45, "stringWithFormat:", CFSTR("%.3f"), v47);
            v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v13, "face");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "faceRecognition");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "classifications");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "anyObject");
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            v95 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v40, "confidence");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "value");
            v52 = v51;
            if (objc_msgSend(v46, "fromTorsoClassification"))
              v53 = CFSTR("T");
            else
              v53 = CFSTR("F");
            objc_msgSend(v46, "confidence");
            v55 = v54;
            objc_msgSend(v46, "personUUID");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "UUIDString");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "substringToIndex:", 2);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "stringWithFormat:", CFSTR("%.3f %@ %.2f %@"), v52, v53, v55, v56);
            v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
        }
        v57 = [HMIHTMLReportBox alloc];
        objc_msgSend(v40, "boundingBox");
        v59 = v58;
        v61 = v60;
        v63 = v62;
        v65 = v64;
        +[HMIVideoAnalyzerEvent rgbColorCodeForEventClass:](HMIVideoAnalyzerEvent, "rgbColorCodeForEventClass:", objc_opt_class());
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          LODWORD(v68) = 1.0;
        }
        else
        {
          objc_msgSend(v40, "confidence");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "value");
          *(float *)&v68 = v69;
        }
        *(float *)&v67 = v9;
        v70 = -[HMIHTMLReportBox initWithBoundingBox:text:color:opacity:value:](v57, "initWithBoundingBox:text:color:opacity:value:", v41, v66, v59, v61, v63, v65, v67, v68);
        objc_msgSend(v10, "addObject:", v70);

        if (!v7)
      }
    }
    objc_msgSend(v13, "torso");
    v71 = objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      v72 = (void *)v71;
      objc_msgSend(v13, "torso");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "boundingBox");
      v74 = CGRectIsEmpty(v99);

      if (!v74)
      {
        objc_msgSend(v13, "torso");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = [HMIHTMLReportBox alloc];
        objc_msgSend(v75, "boundingBox");
        v78 = v77;
        v80 = v79;
        v82 = v81;
        v84 = v83;
        if (v7)
        {
          v85 = &stru_24DBF1B40;
        }
        else
        {
          v86 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v75, "confidence");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "value");
          objc_msgSend(v86, "stringWithFormat:", CFSTR("%.3f"), v87);
          v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        +[HMIVideoAnalyzerEvent rgbColorCodeForEventClass:](HMIVideoAnalyzerEvent, "rgbColorCodeForEventClass:", objc_opt_class());
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          LODWORD(v90) = 1.0;
        }
        else
        {
          objc_msgSend(v75, "confidence");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "value");
          *(float *)&v90 = v91;
        }
        *(float *)&v89 = v9;
        v92 = -[HMIHTMLReportBox initWithBoundingBox:text:color:opacity:value:](v76, "initWithBoundingBox:text:color:opacity:value:", v85, v88, v78, v80, v82, v84, v89, v90);
        objc_msgSend(v10, "addObject:", v92);

        if (v7)
        {
          v73 = v88;
        }
        else
        {

        }
      }
    }
  }
  v93 = (void *)objc_msgSend(v10, "copy");

  return v93;
}

+ (id)boxForRegionOfInterest:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  HMIHTMLReportBox *v7;
  double v8;
  double v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = [HMIHTMLReportBox alloc];
  LODWORD(v8) = 1.0;
  LODWORD(v9) = 1.0;
  return -[HMIHTMLReportBox initWithBoundingBox:text:color:opacity:value:](v7, "initWithBoundingBox:text:color:opacity:value:", &stru_24DBF1B40, CFSTR("#ffff00"), x, y, width, height, v8, v9);
}

- (void)flush
{
  void *v3;
  id v4;

  -[HMIHTMLReport appendString:](self, "appendString:", CFSTR("</body>\n</html>"));
  -[HMIHTMLReport stream](self, "stream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "close");

  -[HMIHTMLReport outputPath](self, "outputPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Visualizer saved (%@)"), v4);

}

- (NSOutputStream)stream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)outputPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputPath, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
