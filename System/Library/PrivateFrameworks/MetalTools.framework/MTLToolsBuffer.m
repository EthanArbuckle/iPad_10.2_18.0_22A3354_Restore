@implementation MTLToolsBuffer

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLToolsBuffer;
  -[MTLToolsResource dealloc](&v2, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "formattedDescription:", a3);
  v10[0] = v5;
  v10[1] = CFSTR("label =");
  if (-[MTLToolsResource label](self, "label"))
    v8 = -[MTLToolsResource label](self, "label");
  else
    v8 = CFSTR("<none>");
  v10[2] = v8;
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 3), "componentsJoinedByString:", CFSTR(" ")));
}

- (unint64_t)length
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "length");
}

- (unint64_t)gpuAddress
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuAddress");
}

- (unint64_t)parentGPUAddress
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parentGPUAddress");
}

- (void)setParentGPUAddress:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setParentGPUAddress:", a3);
}

- (unint64_t)parentGPUSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parentGPUSize");
}

- (void)setParentGPUSize:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setParentGPUSize:", a3);
}

- (void)contents
{
  return (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "contents");
}

- (void)didModifyRange:(_NSRange)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "didModifyRange:", a3.location, a3.length);
}

- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6
{
  id result;
  id v8;
  MTLToolsTexture *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLinearTextureWithDescriptor:offset:bytesPerRow:bytesPerImage:", a3, a4, a5, a6);
  if (result)
  {
    v8 = result;
    v9 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsTexture alloc], "initWithBaseObject:parent:", result, self);

    return v9;
  }
  return result;
}

- (__IOSurface)_aneIOSurface
{
  return (__IOSurface *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "_aneIOSurface");
}

- (void)addDebugMarker:(id)a3 range:(_NSRange)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addDebugMarker:range:", a3, a4.location, a4.length);
}

- (void)removeAllDebugMarkers
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "removeAllDebugMarkers");
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5
{
  id result;
  id v7;
  MTLToolsTexture *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:offset:bytesPerRow:", a3, a4, a5);
  if (result)
  {
    v7 = result;
    v8 = -[MTLToolsTexture initWithBaseObject:parent:buffer:]([MTLToolsTexture alloc], "initWithBaseObject:parent:buffer:", result, -[MTLToolsObject device](self, "device"), self);

    return v8;
  }
  return result;
}

- (__IOSurface)iosurface
{
  return (__IOSurface *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "iosurface");
}

- (BOOL)detachBacking
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "detachBacking");
}

- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "replaceBackingWithRanges:readOnly:", a3, a4);
}

- (BOOL)replaceBackingWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "replaceBackingWithBytesNoCopy:length:deallocator:", a3, a4, a5);
}

@end
