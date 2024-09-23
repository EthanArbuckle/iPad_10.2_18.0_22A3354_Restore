@implementation _MTLRasterizationRateMap

- (_MTLRasterizationRateMap)init
{
  return -[_MTLRasterizationRateMap initWithDevice:descriptor:](self, "initWithDevice:descriptor:", 0, 0);
}

- (_MTLRasterizationRateMap)initWithDevice:(id)a3 descriptor:(id)a4
{
  char *v6;
  int v7;
  __int128 v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_MTLRasterizationRateMap;
  v6 = -[_MTLRasterizationRateMap init](&v11, sel_init);
  if (v6)
  {
    *((_QWORD *)v6 + 1) = a3;
    *((_QWORD *)v6 + 2) = (id)objc_msgSend(a4, "label");
    if (a4)
    {
      objc_msgSend(a4, "screenSize");
    }
    else
    {
      v9 = 0uLL;
      v10 = 0;
    }
    *(_OWORD *)(v6 + 24) = v9;
    *((_QWORD *)v6 + 5) = v10;
    *((_QWORD *)v6 + 5) = objc_msgSend(a4, "layerCount");
    *((_QWORD *)v6 + 6) = objc_msgSend(a4, "mutability");
    objc_msgSend(a4, "minFactor");
    *((_DWORD *)v6 + 14) = v7;
  }
  return (_MTLRasterizationRateMap *)v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLRasterizationRateMap;
  -[_MTLRasterizationRateMap dealloc](&v3, sel_dealloc);
}

- (MTLDevice)device
{
  return self->_device;
}

- (NSString)label
{
  return self->_label;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var0;
  retstr->var2 = 0;
  return self;
}

- (unint64_t)mutability
{
  return self->_mutability;
}

- (float)minFactor
{
  return self->_minFactor;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalGranularity
{
  *(int64x2_t *)&retstr->var0 = vdupq_n_s64(0x20uLL);
  retstr->var2 = 0;
  return self;
}

- (unint64_t)layerCount
{
  return self->_dim.depth;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)parameterBufferSizeAndAlign
{
  unint64_t v2;
  unint64_t v3;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v2 = 0;
  v3 = 1;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalSizeForLayer:(SEL)a3
{
  if (self)
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A screenSize](self, "screenSize", a4);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return self;
}

- (NSString)description
{
  return (NSString *)-[_MTLRasterizationRateMap formattedDescription:](self, "formattedDescription:", 0);
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  unint64_t width;
  const __CFString *label;
  objc_super v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[25];

  v17[24] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v14 = 0;
  v15 = 0;
  v16 = 0;
  if (self)
    -[_MTLRasterizationRateMap physicalGranularity](self, "physicalGranularity");
  v5 = -[_MTLRasterizationRateMap parameterBufferSizeAndAlign](self, "parameterBufferSizeAndAlign");
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)_MTLRasterizationRateMap;
  v9 = -[_MTLRasterizationRateMap description](&v13, sel_description);
  v17[0] = v4;
  v17[1] = CFSTR("label =");
  label = (const __CFString *)self->_label;
  width = self->_dim.width;
  if (!label)
    label = CFSTR("<none>");
  v17[2] = label;
  v17[3] = v4;
  v17[4] = CFSTR("screenSize.width =");
  v17[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", width);
  v17[6] = v4;
  v17[7] = CFSTR("screenSize.height =");
  v17[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_dim.height);
  v17[9] = v4;
  v17[10] = CFSTR("layerCount =");
  v17[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_dim.depth);
  v17[12] = v4;
  v17[13] = CFSTR("physicalGranularity.width =");
  v17[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v17[15] = v4;
  v17[16] = CFSTR("physicalGranularity.height =");
  v17[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v17[18] = v4;
  v17[19] = CFSTR("parameterBuffer.size =");
  v17[20] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v17[21] = v4;
  v17[22] = CFSTR("parameterBuffer.align =");
  v17[23] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  return (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), v9, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 24), "componentsJoinedByString:", CFSTR(" ")));
}

@end
