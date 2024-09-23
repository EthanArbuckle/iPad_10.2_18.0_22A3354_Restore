@implementation OSLogEventMessageArgument

- (NSObject)objectRepresentation
{
  os_log_fmt_raw_placeholder *rawArg;
  NSObject *result;
  uint64_t p_var1;
  uint64_t scalar;

  rawArg = self->_rawArg;
  if (LOBYTE(rawArg[1].var0))
    return 0;
  p_var1 = (uint64_t)&rawArg->var1;
  if ((rawArg->var1.var1 & 0x10) == 0)
    return os_log_fmt_object_for_data(p_var1, BYTE1(rawArg[1].var0), (unsigned __int8 *)rawArg->var0, WORD1(rawArg[1].var0), self->_sizeofLong);
  scalar = os_log_fmt_read_scalar(p_var1, (unsigned __int8 *)rawArg->var0, WORD1(rawArg[1].var0));
  switch(-[OSLogEventMessageArgument scalarCategory](self, "scalarCategory"))
  {
    case 1uLL:
      result = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", scalar);
      break;
    case 2uLL:
      result = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", scalar);
      break;
    case 3uLL:
    case 4uLL:
      result = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&scalar);
      break;
    default:
      return 0;
  }
  return result;
}

- (unint64_t)scalarCategory
{
  unint64_t result;
  os_log_fmt_raw_placeholder *rawArg;
  unsigned int v5;

  result = -[OSLogEventMessageArgument category](self, "category");
  if (result)
  {
    rawArg = self->_rawArg;
    if ((rawArg->var1.var1 & 0x10) != 0 && (v5 = rawArg->var1.var2 - 1, v5 <= 0xE))
      return qword_19EA7EBD0[v5];
    else
      return 0;
  }
  return result;
}

- (unint64_t)category
{
  os_log_fmt_raw_placeholder *rawArg;

  rawArg = self->_rawArg;
  if ((rawArg->var1.var1 & 0x10) != 0)
    return 1;
  if ((rawArg->var1.var2 & 0xFC) != 0x10)
    return 0;
  if (BYTE1(rawArg[1].var0) == 3)
    return 3;
  return 2;
}

- (OSLogEventMessageArgument)initWithProxy:(id)a3 index:(unint64_t)a4
{
  OSLogEventMessageArgument *v6;
  OSLogEventMessageArgument *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OSLogEventMessageArgument;
  v6 = -[OSLogEventMessageArgument init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_decomposedMessage = (OSLogEventDecomposedMessage *)a3;
    v6->_rawArg = (os_log_fmt_raw_placeholder *)objc_msgSend(a3, "_rawPlaceholderForIndex:", a4);
    v7->_sizeofLong = objc_msgSend(a3, "sizeOfLong");
  }
  return v7;
}

- (unint64_t)availability
{
  os_log_fmt_raw_placeholder *rawArg;
  unint64_t result;

  rawArg = self->_rawArg;
  result = 2;
  switch(LOBYTE(rawArg[1].var0))
  {
    case 0:
      if (LOBYTE(rawArg[1].var1.var1))
        result = 3;
      else
        result = 0;
      break;
    case 1:
    case 5:
    case 6:
    case 7:
      return result;
    case 2:
      result = 1;
      break;
    default:
      result = 4;
      break;
  }
  return result;
}

- (unint64_t)privacy
{
  return (unint64_t)self->_rawArg[1].var1.var0;
}

- (const)rawBytes
{
  return self->_rawArg->var0;
}

- (unsigned)rawBytesLength
{
  return WORD1(self->_rawArg[1].var0);
}

- (unint64_t)scalarType
{
  unint64_t result;
  os_log_fmt_raw_placeholder *rawArg;
  unsigned int v5;

  result = -[OSLogEventMessageArgument category](self, "category");
  if (result)
  {
    rawArg = self->_rawArg;
    if ((rawArg->var1.var1 & 0x10) != 0 && (v5 = rawArg->var1.var2 - 1, v5 <= 0xE))
      return qword_19EA7EC48[v5];
    else
      return 0;
  }
  return result;
}

- (unint64_t)unsignedInt64Value
{
  os_log_fmt_raw_placeholder *rawArg;
  double v4;
  unint64_t v6;

  if (!-[OSLogEventMessageArgument availability](self, "availability"))
  {
    rawArg = self->_rawArg;
    if ((rawArg->var1.var1 & 0x10) != 0)
    {
      v4 = COERCE_DOUBLE(os_log_fmt_read_scalar((uint64_t)&rawArg->var1, (unsigned __int8 *)rawArg->var0, WORD1(rawArg[1].var0)));
      v6 = -[OSLogEventMessageArgument scalarCategory](self, "scalarCategory");
      if (v6 - 1 < 2)
        return *(_QWORD *)&v4;
      if (v6 == 4 || v6 == 3)
      {
        *(_QWORD *)&v4 = (unint64_t)v4;
        return *(_QWORD *)&v4;
      }
    }
  }
  v4 = 0.0;
  return *(_QWORD *)&v4;
}

- (int64_t)int64Value
{
  os_log_fmt_raw_placeholder *rawArg;
  double v4;
  unint64_t v6;

  if (!-[OSLogEventMessageArgument availability](self, "availability"))
  {
    rawArg = self->_rawArg;
    if ((rawArg->var1.var1 & 0x10) != 0)
    {
      v4 = COERCE_DOUBLE(os_log_fmt_read_scalar((uint64_t)&rawArg->var1, (unsigned __int8 *)rawArg->var0, WORD1(rawArg[1].var0)));
      v6 = -[OSLogEventMessageArgument scalarCategory](self, "scalarCategory");
      if (v6 - 1 < 2)
        return *(_QWORD *)&v4;
      if (v6 == 4 || v6 == 3)
      {
        *(_QWORD *)&v4 = (uint64_t)v4;
        return *(_QWORD *)&v4;
      }
    }
  }
  v4 = 0.0;
  return *(_QWORD *)&v4;
}

- (double)doubleValue
{
  double v3;
  os_log_fmt_raw_placeholder *rawArg;
  uint64_t scalar;

  v3 = 0.0;
  if (!-[OSLogEventMessageArgument availability](self, "availability"))
  {
    rawArg = self->_rawArg;
    if ((rawArg->var1.var1 & 0x10) != 0)
    {
      scalar = os_log_fmt_read_scalar((uint64_t)&rawArg->var1, (unsigned __int8 *)rawArg->var0, WORD1(rawArg[1].var0));
      switch(-[OSLogEventMessageArgument scalarCategory](self, "scalarCategory"))
      {
        case 1uLL:
          v3 = (double)(unint64_t)scalar;
          break;
        case 2uLL:
          v3 = (double)scalar;
          break;
        case 3uLL:
        case 4uLL:
          v3 = *(double *)&scalar;
          break;
        default:
          return v3;
      }
    }
  }
  return v3;
}

- (double)longDoubleValue
{
  double v2;
  uint64_t v3;
  uint64_t scalar;

  v2 = 0.0;
  if (!objc_msgSend(a1, "availability"))
  {
    v3 = a1[2];
    if ((*(_WORD *)(v3 + 16) & 0x10) != 0)
    {
      scalar = os_log_fmt_read_scalar(v3 + 8, *(unsigned __int8 **)v3, *(unsigned __int16 *)(v3 + 82));
      switch(objc_msgSend(a1, "scalarCategory"))
      {
        case 1:
          v2 = (double)(unint64_t)scalar;
          break;
        case 2:
          v2 = (double)scalar;
          break;
        case 3:
        case 4:
          v2 = *(double *)&scalar;
          break;
        default:
          return v2;
      }
    }
  }
  return v2;
}

@end
