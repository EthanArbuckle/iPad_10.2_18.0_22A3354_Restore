@implementation NSPresentationIntent

- (NSPresentationIntent)parentIntent
{
  return (NSPresentationIntent *)objc_getProperty(self, a2, 16, 1);
}

- (NSPresentationIntentKind)intentKind
{
  return self->_intentKind;
}

- (NSInteger)identity
{
  return self->_identity;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSPresentationIntent;
  -[NSPresentationIntent dealloc](&v3, sel_dealloc);
}

- (id)_init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSPresentationIntent;
  return -[NSPresentationIntent init](&v3, sel_init);
}

+ (NSPresentationIntent)paragraphIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  _QWORD *v6;

  v6 = -[NSPresentationIntent _init]([NSPresentationIntent alloc], "_init");
  v6[3] = identity;
  v6[1] = 0;
  v6[2] = parent;
  return (NSPresentationIntent *)v6;
}

- (unint64_t)hash
{
  int64_t v3;
  NSUInteger v4;
  NSArray *columnAlignments;
  int64_t v6;

  v3 = self->_intentKind ^ self->_identity ^ self->_headerLevel ^ self->_indentationLevel;
  v4 = v3 ^ -[NSString hash](self->_languageHint, "hash") ^ self->_columnCount;
  columnAlignments = self->_columnAlignments;
  v6 = self->_ordinal ^ self->_column ^ self->_row;
  return v4 ^ v6 ^ -[NSArray hash](columnAlignments, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = objc_msgSend(a3, "identity"), v5 == -[NSPresentationIntent identity](self, "identity")))
  {
    return -[NSPresentationIntent isEquivalentToPresentationIntent:](self, "isEquivalentToPresentationIntent:", a3);
  }
  else
  {
    return 0;
  }
}

- (BOOL)isEquivalentToPresentationIntent:(NSPresentationIntent *)other
{
  NSString *v5;
  NSString *v6;
  NSPresentationIntent *v7;
  NSPresentationIntent *v8;
  NSArray *v9;
  NSArray *v10;
  NSPresentationIntentKind v11;
  int v12;
  NSInteger v13;
  NSInteger v14;
  NSInteger v15;
  NSInteger v16;
  NSInteger v17;
  NSInteger v18;

  if (other == self)
    goto LABEL_17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v5 = -[NSPresentationIntent languageHint](self, "languageHint"),
        v6 = -[NSPresentationIntent languageHint](other, "languageHint"),
        v7 = -[NSPresentationIntent parentIntent](self, "parentIntent"),
        v8 = -[NSPresentationIntent parentIntent](other, "parentIntent"),
        v9 = -[NSPresentationIntent columnAlignments](self, "columnAlignments"),
        v10 = -[NSPresentationIntent columnAlignments](other, "columnAlignments"),
        v11 = -[NSPresentationIntent intentKind](other, "intentKind"),
        v11 != -[NSPresentationIntent intentKind](self, "intentKind")))
  {
LABEL_16:
    LOBYTE(v12) = 0;
    return v12;
  }
  if (v5 == v6 || (v12 = -[NSString isEqual:](v5, "isEqual:", v6)) != 0)
  {
    v13 = -[NSPresentationIntent headerLevel](other, "headerLevel");
    if (v13 != -[NSPresentationIntent headerLevel](self, "headerLevel"))
      goto LABEL_16;
    v14 = -[NSPresentationIntent ordinal](other, "ordinal");
    if (v14 != -[NSPresentationIntent ordinal](self, "ordinal"))
      goto LABEL_16;
    v15 = -[NSPresentationIntent indentationLevel](other, "indentationLevel");
    if (v15 != -[NSPresentationIntent indentationLevel](self, "indentationLevel"))
      goto LABEL_16;
    if (v9 == v10
      || (v12 = -[NSArray isEqual:](-[NSPresentationIntent columnAlignments](other, "columnAlignments"), "isEqual:", -[NSPresentationIntent columnAlignments](self, "columnAlignments"))) != 0)
    {
      v16 = -[NSPresentationIntent columnCount](other, "columnCount");
      if (v16 == -[NSPresentationIntent columnCount](self, "columnCount"))
      {
        v17 = -[NSPresentationIntent column](other, "column");
        if (v17 == -[NSPresentationIntent column](self, "column"))
        {
          v18 = -[NSPresentationIntent row](other, "row");
          if (v18 == -[NSPresentationIntent row](self, "row"))
          {
            if (v7 != v8)
            {
              LOBYTE(v12) = -[NSPresentationIntent isEquivalentToPresentationIntent:](v7, "isEquivalentToPresentationIntent:", v8);
              return v12;
            }
LABEL_17:
            LOBYTE(v12) = 1;
            return v12;
          }
        }
      }
      goto LABEL_16;
    }
  }
  return v12;
}

- (id)description
{
  NSMutableString *v3;
  unint64_t v4;
  const __CFString *v5;
  NSString *languageHint;
  NSArray *columnAlignments;
  int64_t columnCount;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  const __CFString *v16;
  char v17;
  const __CFString *v18;
  int64_t row;
  uint64_t v21;
  int64_t v22;
  NSMutableString *v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString initWithFormat:]([NSMutableString alloc], "initWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
  -[NSMutableString appendString:](v3, "appendString:", CFSTR(": "));
  v4 = self->_intentKind - 1;
  if (v4 > 0xA)
    v5 = CFSTR("Paragraph");
  else
    v5 = off_1E0F54CB0[v4];
  -[NSMutableString appendString:](v3, "appendString:", v5);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" (id %ld)"), self->_identity);
  switch(self->_intentKind)
  {
    case 1:
      -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" (%ld) indent %ld"), self->_headerLevel, self->_indentationLevel);
      break;
    case 2:
    case 3:
      -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" indent %ld"), self->_indentationLevel, v21);
      break;
    case 4:
      -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" ordinal %ld, indent %ld"), self->_ordinal, self->_indentationLevel);
      break;
    case 5:
      languageHint = self->_languageHint;
      if (!languageHint)
        languageHint = (NSString *)CFSTR("no hint");
      -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" (%@) indent %ld"), languageHint, self->_indentationLevel);
      break;
    case 8:
      columnAlignments = self->_columnAlignments;
      columnCount = self->_columnCount;
      if (columnAlignments && -[NSArray count](self->_columnAlignments, "count"))
      {
        v22 = columnCount;
        v23 = v3;
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](columnAlignments, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v26 != v12)
                objc_enumerationMutation(columnAlignments);
              v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              v15 = objc_msgSend(v14, "isEqual:", &off_1E0FBE958);
              v16 = CFSTR("left");
              if ((v15 & 1) == 0)
              {
                v17 = objc_msgSend(v14, "isEqual:", &off_1E0FBE970);
                v16 = CFSTR("right");
                if ((v17 & 1) == 0)
                {
                  if (objc_msgSend(v14, "isEqual:", &off_1E0FBE988))
                    v16 = CFSTR("center");
                  else
                    v16 = CFSTR("unknown");
                }
              }
              objc_msgSend(v9, "addObject:", v16);
            }
            v11 = -[NSArray countByEnumeratingWithState:objects:count:](columnAlignments, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
          }
          while (v11);
        }
        v18 = (const __CFString *)objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
        v3 = v23;
        columnCount = v22;
      }
      else
      {
        v18 = CFSTR("none");
      }
      -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" %ld columns, alignment %@"), columnCount, v18);
      break;
    case 0xALL:
      row = self->_row;
      goto LABEL_28;
    case 0xBLL:
      row = self->_column;
LABEL_28:
      -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" # %ld"), row, v21);
      break;
    default:
      break;
  }
  if (self->_parentIntent)
  {
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("\n "));
    -[NSMutableString appendString:](v3, "appendString:", -[NSPresentationIntent description](self->_parentIntent, "description"));
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPresentationIntent)initWithCoder:(id)a3
{
  NSPresentationIntent *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v4 = -[NSPresentationIntent _init](self, "_init");
  if (v4)
  {
    v4->_intentKind = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.intentKind"));
    v4->_parentIntent = (NSPresentationIntent *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.parentIntent"));
    v4->_identity = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.identity"));
    v4->_ordinal = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.ordinal"));
    if (objc_msgSend(a3, "requiresSecureCoding"))
    {
      v5 = (void *)objc_msgSend(a3, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("NS.columnAlignments"));
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C99E60];
      v8[0] = objc_opt_class();
      v8[1] = objc_opt_class();
      v5 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2)), CFSTR("NS.columnAlignments"));
    }
    v4->_columnAlignments = (NSArray *)v5;
    v4->_columnCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.columnCount"));
    v4->_headerLevel = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.headerLevel"));
    v4->_languageHint = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.languageHint"));
    v4->_column = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.column"));
    v4->_row = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.row"));
    v4->_indentationLevel = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.indentationLevel"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSPresentationIntent intentKind](self, "intentKind"), CFSTR("NS.intentKind"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSPresentationIntent parentIntent](self, "parentIntent"), CFSTR("NS.parentIntent"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSPresentationIntent identity](self, "identity"), CFSTR("NS.identity"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSPresentationIntent ordinal](self, "ordinal"), CFSTR("NS.ordinal"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSPresentationIntent columnAlignments](self, "columnAlignments"), CFSTR("NS.columnAlignments"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSPresentationIntent columnCount](self, "columnCount"), CFSTR("NS.columnCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSPresentationIntent headerLevel](self, "headerLevel"), CFSTR("NS.headerLevel"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSPresentationIntent languageHint](self, "languageHint"), CFSTR("NS.languageHint"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSPresentationIntent column](self, "column"), CFSTR("NS.column"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSPresentationIntent row](self, "row"), CFSTR("NS.row"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSPresentationIntent indentationLevel](self, "indentationLevel"), CFSTR("NS.indentationLevel"));
}

+ (NSPresentationIntent)headerIntentWithIdentity:(NSInteger)identity level:(NSInteger)level nestedInsideIntent:(NSPresentationIntent *)parent
{
  _QWORD *v8;
  NSInteger v9;

  v8 = -[NSPresentationIntent _init]([NSPresentationIntent alloc], "_init");
  v8[3] = identity;
  v8[1] = 1;
  v8[7] = level;
  if (parent)
    v9 = -[NSPresentationIntent indentationLevel](parent, "indentationLevel");
  else
    v9 = 0;
  v8[11] = v9;
  v8[2] = parent;
  return (NSPresentationIntent *)v8;
}

+ (NSPresentationIntent)codeBlockIntentWithIdentity:(NSInteger)identity languageHint:(NSString *)languageHint nestedInsideIntent:(NSPresentationIntent *)parent
{
  _QWORD *v8;
  NSInteger v9;

  v8 = -[NSPresentationIntent _init]([NSPresentationIntent alloc], "_init");
  v8[3] = identity;
  v8[1] = 5;
  v8[8] = -[NSString copy](languageHint, "copy");
  if (parent)
    v9 = -[NSPresentationIntent indentationLevel](parent, "indentationLevel");
  else
    v9 = 0;
  v8[11] = v9;
  v8[2] = parent;
  return (NSPresentationIntent *)v8;
}

+ (NSPresentationIntent)thematicBreakIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  _QWORD *v6;

  v6 = -[NSPresentationIntent _init]([NSPresentationIntent alloc], "_init");
  v6[3] = identity;
  v6[1] = 7;
  v6[2] = parent;
  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)orderedListIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  _QWORD *v6;
  NSInteger v7;

  v6 = -[NSPresentationIntent _init]([NSPresentationIntent alloc], "_init");
  v6[3] = identity;
  v6[1] = 2;
  if (parent)
    v7 = -[NSPresentationIntent indentationLevel](parent, "indentationLevel");
  else
    v7 = 0;
  v6[11] = v7;
  v6[2] = parent;
  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)unorderedListIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  _QWORD *v6;
  NSInteger v7;

  v6 = -[NSPresentationIntent _init]([NSPresentationIntent alloc], "_init");
  v6[3] = identity;
  v6[1] = 3;
  if (parent)
    v7 = -[NSPresentationIntent indentationLevel](parent, "indentationLevel");
  else
    v7 = 0;
  v6[11] = v7;
  v6[2] = parent;
  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)listItemIntentWithIdentity:(NSInteger)identity ordinal:(NSInteger)ordinal nestedInsideIntent:(NSPresentationIntent *)parent
{
  _QWORD *v8;
  NSInteger v9;

  v8 = -[NSPresentationIntent _init]([NSPresentationIntent alloc], "_init");
  v8[1] = 4;
  v8[3] = identity;
  v8[4] = ordinal;
  if (parent)
    v9 = -[NSPresentationIntent indentationLevel](parent, "indentationLevel") + 1;
  else
    v9 = 0;
  v8[11] = v9;
  v8[2] = parent;
  return (NSPresentationIntent *)v8;
}

+ (NSPresentationIntent)blockQuoteIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  _QWORD *v6;
  NSInteger v7;

  v6 = -[NSPresentationIntent _init]([NSPresentationIntent alloc], "_init");
  v6[3] = identity;
  v6[1] = 6;
  if (parent)
    v7 = -[NSPresentationIntent indentationLevel](parent, "indentationLevel") + 1;
  else
    v7 = 0;
  v6[11] = v7;
  v6[2] = parent;
  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)tableIntentWithIdentity:(NSInteger)identity columnCount:(NSInteger)columnCount alignments:(NSArray *)alignments nestedInsideIntent:(NSPresentationIntent *)parent
{
  _QWORD *v12;
  void *v14;

  if (-[NSArray count](alignments, "count") != columnCount)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: column count does not match count of alignments"), _NSMethodExceptionProem((objc_class *)a1, a2)), 0);
    objc_exception_throw(v14);
  }
  v12 = -[NSPresentationIntent _init]([NSPresentationIntent alloc], "_init");
  v12[3] = identity;
  v12[1] = 8;
  v12[2] = parent;
  v12[6] = columnCount;
  v12[5] = -[NSArray copy](alignments, "copy");
  return (NSPresentationIntent *)v12;
}

+ (NSPresentationIntent)tableRowIntentWithIdentity:(NSInteger)identity row:(NSInteger)row nestedInsideIntent:(NSPresentationIntent *)parent
{
  _QWORD *v8;

  v8 = -[NSPresentationIntent _init]([NSPresentationIntent alloc], "_init");
  v8[3] = identity;
  v8[1] = 10;
  v8[10] = row;
  v8[2] = parent;
  return (NSPresentationIntent *)v8;
}

+ (NSPresentationIntent)tableHeaderRowIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  _QWORD *v6;

  v6 = -[NSPresentationIntent _init]([NSPresentationIntent alloc], "_init");
  v6[3] = identity;
  v6[1] = 9;
  v6[2] = parent;
  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)tableCellIntentWithIdentity:(NSInteger)identity column:(NSInteger)column nestedInsideIntent:(NSPresentationIntent *)parent
{
  _QWORD *v8;

  v8 = -[NSPresentationIntent _init]([NSPresentationIntent alloc], "_init");
  v8[3] = identity;
  v8[1] = 11;
  v8[9] = column;
  v8[2] = parent;
  return (NSPresentationIntent *)v8;
}

- (NSInteger)ordinal
{
  return self->_ordinal;
}

- (NSArray)columnAlignments
{
  return self->_columnAlignments;
}

- (NSInteger)columnCount
{
  return self->_columnCount;
}

- (NSInteger)headerLevel
{
  return self->_headerLevel;
}

- (NSString)languageHint
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSInteger)column
{
  return self->_column;
}

- (NSInteger)row
{
  return self->_row;
}

- (NSInteger)indentationLevel
{
  return self->_indentationLevel;
}

@end
