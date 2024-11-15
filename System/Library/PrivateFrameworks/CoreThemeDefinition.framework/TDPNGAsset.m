@implementation TDPNGAsset

- (void)_logError:(id)a3
{
  NSLog(CFSTR("%@"), a2, a3);
}

- (CGSize)sourceImageSizeWithDocument:(id)a3
{
  double Width;
  double Height;
  const __CFURL *v6;
  unsigned int v7;
  CGPDFDocumentRef v8;
  CGPDFDocument *v9;
  unsigned int v10;
  unsigned int v11;
  double v12;
  unsigned int v13;
  CGPDFPage *Page;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unsigned int v21;
  double v22;
  unsigned int v23;
  CFNumberRef v24;
  uint64_t v25;
  uint64_t v26;
  const __CFDictionary *v27;
  CGImageSource *v28;
  CGImageSource *v29;
  CGImage *ImageAtIndex;
  CGImage *v31;
  double v32;
  double v33;
  unsigned int valuePtr;
  _QWORD v35[3];
  _QWORD v36[4];
  CGSize result;
  CGRect BoxRect;

  v36[3] = *MEMORY[0x24BDAC8D0];
  Width = *MEMORY[0x24BDBF148];
  Height = *(double *)(MEMORY[0x24BDBF148] + 8);
  v6 = -[TDAsset fileURLWithDocument:](self, "fileURLWithDocument:", a3);
  if (objc_msgSend((id)-[__CFURL pathExtension](v6, "pathExtension"), "caseInsensitiveCompare:", CFSTR("PDF")))
  {
    if (objc_msgSend((id)-[__CFURL pathExtension](v6, "pathExtension"), "caseInsensitiveCompare:", CFSTR("SVG")))
    {
      if ((int)-[TDAsset scaleFactor](self, "scaleFactor") < 1)
        v7 = 72;
      else
        v7 = 72 * -[TDAsset scaleFactor](self, "scaleFactor");
      valuePtr = v7;
      v24 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
      v25 = *MEMORY[0x24BDD97D0];
      v35[0] = *MEMORY[0x24BDD97C0];
      v35[1] = v25;
      v26 = *MEMORY[0x24BDBD268];
      v36[0] = v24;
      v36[1] = v26;
      v35[2] = *MEMORY[0x24BDD97F0];
      v36[2] = *MEMORY[0x24BDBD270];
      v27 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
      CFRelease(v24);
      v28 = CGImageSourceCreateWithURL(v6, 0);
      if (v28)
      {
        v29 = v28;
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v28, 0, v27);
        if (ImageAtIndex)
        {
          v31 = ImageAtIndex;
          Width = (double)CGImageGetWidth(ImageAtIndex);
          Height = (double)CGImageGetHeight(v31);
          CGImageRelease(v31);
        }
        CFRelease(v29);
        goto LABEL_27;
      }
LABEL_26:
      -[TDPNGAsset _logError:](self, "_logError:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to get image dimensions for %@"), v6));
      goto LABEL_27;
    }
    if (!CGSVGDocumentCreateFromURL())
      goto LABEL_26;
    CGSVGDocumentGetCanvasSize();
    v18 = v17;
    v20 = v19;
    v21 = -[TDAsset scaleFactor](self, "scaleFactor");
    v22 = (double)v21;
    v23 = -[TDPNGAsset fileScaleFactor](self, "fileScaleFactor");
    if (!v21)
    {
      v22 = 1.0;
      v23 = 1;
    }
    if (!v23)
      v23 = +[TDAsset scaleFactorFromImageFilename:](TDAsset, "scaleFactorFromImageFilename:", -[__CFURL path](v6, "path"));
    Width = round(v22 * (v18 / (double)v23));
    Height = round(v22 * (v20 / (double)v23));
    CGSVGDocumentRelease();
  }
  else
  {
    v8 = CGPDFDocumentCreateWithURL(v6);
    if (!v8)
      goto LABEL_26;
    v9 = v8;
    v10 = -[TDAsset scaleFactor](self, "scaleFactor");
    v11 = -[TDPNGAsset fileScaleFactor](self, "fileScaleFactor");
    if (v10)
      v12 = (double)v10;
    else
      v12 = 1.0;
    if (v10)
      v13 = v11;
    else
      v13 = 1;
    Page = CGPDFDocumentGetPage(v9, 1uLL);
    BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
    v15 = BoxRect.size.width;
    v16 = BoxRect.size.height;
    if (!v13)
      v13 = +[TDAsset scaleFactorFromImageFilename:](TDAsset, "scaleFactorFromImageFilename:", -[__CFURL path](v6, "path", BoxRect.origin.x, BoxRect.origin.y));
    Width = round(v12 * (v15 / (double)v13));
    Height = round(v12 * (v16 / (double)v13));
    CGPDFDocumentRelease(v9);
  }
LABEL_27:
  v32 = Width;
  v33 = Height;
  result.height = v33;
  result.width = v32;
  return result;
}

- (id)sourceImageWithDocument:(id)a3
{
  const __CFURL *v4;
  CGImageSource *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  CGImageRef ImageAtIndex;
  CGImage *v11;
  unsigned int *v12;
  const __CFDictionary *v13;
  const __CFDictionary *v14;
  const void *v15;
  const __CFNumber *Value;
  const __CFNumber *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v4 = -[TDAsset fileURLWithDocument:](self, "fileURLWithDocument:", a3);
  v5 = CGImageSourceCreateWithURL(v4, 0);
  v6 = *MEMORY[0x24BDD97D0];
  v20[0] = *MEMORY[0x24BDD97F0];
  v20[1] = v6;
  v7 = *MEMORY[0x24BDBD268];
  v21[0] = *MEMORY[0x24BDBD270];
  v21[1] = v7;
  v8 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  if (!v5)
    goto LABEL_13;
  v9 = v8;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, v8);
  if (!ImageAtIndex)
  {
    CFRelease(v5);
LABEL_13:
    -[TDPNGAsset _logError:](self, "_logError:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CoreThemeDefinition: Unable to create image for %@"), v4));
    return 0;
  }
  v11 = ImageAtIndex;
  v12 = &self->super._scaleFactor + 1;
  *v12 = 1;
  v13 = CGImageSourceCopyPropertiesAtIndex(v5, 0, v9);
  if (v13)
  {
    v14 = v13;
    v15 = (const void *)*MEMORY[0x24BDD9698];
    Value = (const __CFNumber *)CFDictionaryGetValue(v13, (const void *)*MEMORY[0x24BDD9698]);
    if (Value && !CFNumberGetValue(Value, kCFNumberSInt32Type, v12))
      *v12 = 1;
    v17 = (const __CFNumber *)CFDictionaryGetValue(v14, v15);
    if (v17 && !CFNumberGetValue(v17, kCFNumberSInt32Type, v12))
      *v12 = 1;
    CFRelease(v14);
  }
  CFRelease(v5);
  v18 = (void *)objc_msgSend(MEMORY[0x24BE28C38], "imageWithCGImage:", v11);
  CGImageRelease(v11);
  return v18;
}

- (int)exifOrientation
{
  int v2;

  v2 = *(&self->super._scaleFactor + 1);
  if (!v2)
  {
    v2 = 1;
    *(&self->super._scaleFactor + 1) = 1;
  }
  return v2;
}

- (void)setFileScaleFactor:(unsigned int)a3
{
  -[TDPNGAsset willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("fileScaleFactor"));
  self->_exifOrientation = a3;
  -[TDPNGAsset didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("fileScaleFactor"));
}

- (unsigned)fileScaleFactor
{
  unsigned int exifOrientation;

  -[TDPNGAsset willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("fileScaleFactor"));
  exifOrientation = self->_exifOrientation;
  -[TDPNGAsset didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("fileScaleFactor"));
  return exifOrientation;
}

- (BOOL)hasCursorProduction
{
  return 0;
}

- (BOOL)hasProduction
{
  uint64_t v3;

  v3 = -[TDPNGAsset renditions](self, "renditions");
  if (v3)
    LOBYTE(v3) = objc_msgSend((id)-[TDPNGAsset renditions](self, "renditions"), "count") != 0;
  return v3;
}

@end
