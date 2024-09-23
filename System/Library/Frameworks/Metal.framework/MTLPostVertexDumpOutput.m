@implementation MTLPostVertexDumpOutput

- (MTLPostVertexDumpOutput)initWithAirMDType:(id)a3 dataType:(unint64_t)a4 pixelFormat:(unint64_t)a5 aluType:(unint64_t)a6 name:(id)a7 offset:(unint64_t)a8
{
  MTLPostVertexDumpOutput *v14;
  id v15;
  id v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MTLPostVertexDumpOutput;
  v14 = -[MTLPostVertexDumpOutput init](&v18, sel_init);
  v14->_airMDType = (NSString *)a3;
  v15 = a3;
  v14->_dataType = a4;
  v14->_pixelFormat = a5;
  v14->_aluType = a6;
  v14->_name = (NSString *)a7;
  v16 = a7;
  v14->_offset = a8;
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLPostVertexDumpOutput;
  -[MTLPostVertexDumpOutput dealloc](&v3, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  unint64_t dataType;
  const __CFString *airMDType;
  unint64_t offset;
  const __CFString *name;
  objc_super v13;
  _QWORD v14[19];

  v14[18] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)MTLPostVertexDumpOutput;
  v7 = -[MTLPostVertexDumpOutput description](&v13, sel_description);
  v14[0] = v5;
  v14[1] = CFSTR("airMDType =");
  airMDType = (const __CFString *)self->_airMDType;
  dataType = self->_dataType;
  if (!airMDType)
    airMDType = CFSTR("<none>");
  v14[2] = airMDType;
  v14[3] = v5;
  v14[4] = CFSTR("dataType =");
  v14[5] = MTLDataTypeString(dataType);
  v14[6] = v5;
  v14[7] = CFSTR("pixelFormat =");
  v14[8] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MTLPixelFormatGetName(self->_pixelFormat));
  v14[9] = v5;
  v14[10] = CFSTR("aluType =");
  v14[11] = MTLDataTypeString(self->_aluType);
  v14[12] = v5;
  name = (const __CFString *)self->_name;
  offset = self->_offset;
  if (!name)
    name = CFSTR("<none>");
  v14[13] = CFSTR("name =");
  v14[14] = name;
  v14[15] = v5;
  v14[16] = CFSTR("offset =");
  v14[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", offset);
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 18), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  id v3;
  id v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[MTLPostVertexDumpOutput formattedDescription:withPrintedTypes:](self, "formattedDescription:withPrintedTypes:", 0, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  int v6;

  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_2;
  v6 = objc_msgSend((id)objc_msgSend(a3, "airMDType"), "isEqualToString:", self->_airMDType);
  if (!v6)
    return v6;
  if (objc_msgSend(a3, "dataType") == self->_dataType && objc_msgSend(a3, "pixelFormat") == self->_pixelFormat)
  {
    v6 = objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", self->_name);
    if (v6)
      LOBYTE(v6) = objc_msgSend(a3, "offset") == self->_offset;
  }
  else
  {
LABEL_2:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (NSString)airMDType
{
  return self->_airMDType;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)aluType
{
  return self->_aluType;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)offset
{
  return self->_offset;
}

@end
