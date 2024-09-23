@implementation TDTextureAsset

- (void)_logError:(id)a3
{
  NSLog(CFSTR("%@"), a2, a3);
}

- (CGSize)sourceImageSizeWithDocument:(id)a3
{
  const __CFURL *v4;
  unsigned int v5;
  CFNumberRef v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  CGImageSource *v10;
  CGImageSource *v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  double v14;
  double v15;
  CFNumberRef number;
  void *value;
  unsigned int valuePtr;
  double v19[3];
  _QWORD v20[3];
  _QWORD v21[4];
  CGSize result;

  v21[3] = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)v19 = *MEMORY[0x24BDBF148];
  v4 = -[TDAsset fileURLWithDocument:](self, "fileURLWithDocument:", a3);
  if ((int)-[TDAsset scaleFactor](self, "scaleFactor") < 1)
    v5 = 72;
  else
    v5 = 72 * -[TDAsset scaleFactor](self, "scaleFactor");
  valuePtr = v5;
  v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  v7 = *MEMORY[0x24BDD97D0];
  v20[0] = *MEMORY[0x24BDD97C0];
  v20[1] = v7;
  v8 = *MEMORY[0x24BDBD268];
  v21[0] = v6;
  v21[1] = v8;
  v20[2] = *MEMORY[0x24BDD97F0];
  v21[2] = *MEMORY[0x24BDBD270];
  v9 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  CFRelease(v6);
  v10 = CGImageSourceCreateWithURL(v4, 0);
  if (v10)
  {
    v11 = v10;
    v12 = CGImageSourceCopyPropertiesAtIndex(v10, 0, v9);
    if (v12)
    {
      v13 = v12;
      number = 0;
      value = 0;
      if (CFDictionaryGetValueIfPresent(v12, (const void *)*MEMORY[0x24BDD96C8], (const void **)&value)
        && CFDictionaryGetValueIfPresent(v13, (const void *)*MEMORY[0x24BDD96C0], (const void **)&number))
      {
        CFNumberGetValue((CFNumberRef)value, kCFNumberCGFloatType, v19);
        CFNumberGetValue(number, kCFNumberCGFloatType, &v19[1]);
      }
      CFRelease(v13);
    }
    CFRelease(v11);
  }
  else
  {
    -[TDTextureAsset _logError:](self, "_logError:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to get image dimensions for %@"), v4));
  }
  v15 = v19[1];
  v14 = v19[0];
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)sourceImageWithDocument:(id)a3
{
  const __CFURL *v4;
  CGImageSource *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  CGImageRef ImageAtIndex;
  CGImage *v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  const void *v12;
  const __CFNumber *Value;
  uint64_t v14;
  const __CFNumber *v15;
  uint64_t v16;
  void *v17;
  unsigned int valuePtr;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = -[TDAsset fileURLWithDocument:](self, "fileURLWithDocument:", a3);
  v5 = CGImageSourceCreateWithURL(v4, 0);
  v20 = *MEMORY[0x24BDD97F0];
  v21[0] = *MEMORY[0x24BDBD270];
  v6 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  if (!v5)
    goto LABEL_17;
  v7 = v6;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, v6);
  if (!ImageAtIndex)
  {
    CFRelease(v5);
LABEL_17:
    -[TDTextureAsset _logError:](self, "_logError:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CoreThemeDefinition: Unable to create image for %@"), v4));
    return 0;
  }
  v9 = ImageAtIndex;
  -[TDTextureAsset setExifOrientation:](self, "setExifOrientation:", 1);
  valuePtr = 0;
  v10 = CGImageSourceCopyPropertiesAtIndex(v5, 0, v7);
  if (v10)
  {
    v11 = v10;
    v12 = (const void *)*MEMORY[0x24BDD9698];
    Value = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x24BDD9698]);
    if (Value)
    {
      if (CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr))
        v14 = valuePtr;
      else
        v14 = 1;
      -[TDTextureAsset setExifOrientation:](self, "setExifOrientation:", v14);
    }
    v15 = (const __CFNumber *)CFDictionaryGetValue(v11, v12);
    if (v15)
    {
      if (CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr))
        v16 = valuePtr;
      else
        v16 = 1;
      -[TDTextureAsset setExifOrientation:](self, "setExifOrientation:", v16);
    }
    CFRelease(v11);
  }
  v17 = (void *)objc_msgSend(MEMORY[0x24BE28C38], "imageWithCGImage:", v9);
  CGImageRelease(v9);
  CFRelease(v5);
  return v17;
}

- (int)exifOrientation
{
  return *(&self->super._scaleFactor + 1);
}

- (void)setExifOrientation:(int)a3
{
  *(&self->super._scaleFactor + 1) = a3;
}

@end
