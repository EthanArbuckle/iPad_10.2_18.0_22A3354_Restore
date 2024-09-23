@implementation MFIMAPFetchResult

- (MFIMAPFetchResult)initWithType:(int64_t)a3
{
  MFIMAPFetchResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFIMAPFetchResult;
  result = -[MFIMAPFetchResult init](&v5, sel_init);
  if (result)
    result->_itemType = a3;
  return result;
}

- (void)dealloc
{
  unint64_t itemType;
  uint64_t v4;
  objc_super v5;

  itemType = self->_itemType;
  if (itemType <= 0xC)
  {
    if (((1 << itemType) & 0x1046) != 0)
    {
      v4 = 24;
      goto LABEL_8;
    }
    if (((1 << itemType) & 0xB0) != 0)
    {

      v4 = 40;
      goto LABEL_8;
    }
    if (((1 << itemType) & 0x700) != 0)
    {
      v4 = 32;
LABEL_8:

    }
  }
  v5.receiver = self;
  v5.super_class = (Class)MFIMAPFetchResult;
  -[MFIMAPFetchResult dealloc](&v5, sel_dealloc);
}

- (int64_t)type
{
  return self->_itemType;
}

- (id)envelope
{
  void *v4;
  uint64_t v5;

  if (self->_itemType != 1)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult envelope]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MFIMAPFetchResult.m"), 96, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  return self->_typeSpecific.envelope;
}

- (void)setEnvelope:(id)a3
{
  NSArray *envelope;
  void *v6;
  uint64_t v7;

  if (self->_itemType != 1)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult setEnvelope:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MFIMAPFetchResult.m"), 102, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  envelope = self->_typeSpecific.envelope;
  if (envelope != a3)
  {

    self->_typeSpecific.messageSize = (unint64_t)a3;
  }
}

- (id)internalDate
{
  void *v4;
  uint64_t v5;

  if (self->_itemType != 2)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult internalDate]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MFIMAPFetchResult.m"), 112, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  return self->_typeSpecific.envelope;
}

- (void)setInternalDate:(id)a3
{
  NSArray *envelope;
  void *v6;
  uint64_t v7;

  if (self->_itemType != 2)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult setInternalDate:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MFIMAPFetchResult.m"), 118, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  envelope = self->_typeSpecific.envelope;
  if (envelope != a3)
  {

    self->_typeSpecific.messageSize = (unint64_t)a3;
  }
}

- (id)fetchData
{
  unint64_t itemType;
  BOOL v4;
  uint64_t v5;
  void *v8;
  uint64_t v9;

  itemType = self->_itemType;
  v4 = itemType > 7;
  v5 = (1 << itemType) & 0xB0;
  if (!v4 && v5 != 0)
    return self->_typeSpecific.bodySectionInfo.sectionData;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult fetchData]");
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("MFIMAPFetchResult.m"), 135, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  return 0;
}

- (void)setFetchData:(id)a3
{
  unint64_t itemType;
  BOOL v5;
  uint64_t v6;
  NSData *sectionData;
  void *v10;
  uint64_t v11;

  itemType = self->_itemType;
  v5 = itemType > 7;
  v6 = (1 << itemType) & 0xB0;
  if (v5 || v6 == 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult setFetchData:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("MFIMAPFetchResult.m"), 151, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  else
  {
    sectionData = self->_typeSpecific.bodySectionInfo.sectionData;
    if (sectionData != a3)
    {

      self->_typeSpecific.bodySectionInfo.sectionData = (NSData *)a3;
    }
  }
}

- (unint64_t)messageSize
{
  void *v4;
  uint64_t v5;

  if (self->_itemType != 3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult messageSize]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MFIMAPFetchResult.m"), 157, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  return self->_typeSpecific.messageSize;
}

- (void)setMessageSize:(unint64_t)a3
{
  void *v5;
  uint64_t v6;

  if (self->_itemType != 3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult setMessageSize:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MFIMAPFetchResult.m"), 161, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  self->_typeSpecific.messageSize = a3;
}

- (id)bodyStructure
{
  void *v4;
  uint64_t v5;

  if (self->_itemType != 6)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult bodyStructure]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MFIMAPFetchResult.m"), 166, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  return self->_typeSpecific.envelope;
}

- (void)setBodyStructure:(id)a3
{
  NSArray *envelope;
  void *v6;
  uint64_t v7;

  if (self->_itemType != 6)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult setBodyStructure:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MFIMAPFetchResult.m"), 172, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  envelope = self->_typeSpecific.envelope;
  if (envelope != a3)
  {

    self->_typeSpecific.messageSize = (unint64_t)a3;
  }
}

- (unint64_t)startOffset
{
  unint64_t itemType;
  BOOL v4;
  uint64_t v5;
  void *v8;
  uint64_t v9;

  itemType = self->_itemType;
  v4 = itemType > 7;
  v5 = (1 << itemType) & 0xB0;
  if (!v4 && v5 != 0)
    return self->_typeSpecific.bodySectionInfo.startOffset;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult startOffset]");
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("MFIMAPFetchResult.m"), 189, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  return 0;
}

- (void)setStartOffset:(unint64_t)a3
{
  void *v5;
  uint64_t v6;

  if (self->_itemType != 7)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult setStartOffset:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MFIMAPFetchResult.m"), 197, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  self->_typeSpecific.bodySectionInfo.startOffset = a3;
}

- (id)section
{
  int64_t itemType;
  void *v5;
  uint64_t v6;

  itemType = self->_itemType;
  switch(itemType)
  {
    case 4:
      return CFSTR("HEADER");
    case 7:
      return self->_typeSpecific.envelope;
    case 5:
      return CFSTR("TEXT");
  }
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult section]");
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MFIMAPFetchResult.m"), 214, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  return 0;
}

- (void)setSection:(id)a3
{
  NSArray *envelope;
  void *v6;
  uint64_t v7;

  if (self->_itemType != 7)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult setSection:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MFIMAPFetchResult.m"), 221, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  envelope = self->_typeSpecific.envelope;
  if (envelope != a3)
  {

    self->_typeSpecific.messageSize = (unint64_t)a3;
  }
}

- (unsigned)uid
{
  void *v4;
  uint64_t v5;

  if (self->_itemType != 8)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult uid]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MFIMAPFetchResult.m"), 230, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  return self->_typeSpecific.uid;
}

- (void)setUid:(unsigned int)a3
{
  void *v5;
  uint64_t v6;

  if (self->_itemType != 8)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult setUid:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MFIMAPFetchResult.m"), 235, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  self->_typeSpecific.uid = a3;
}

- (unint64_t)uniqueRemoteId
{
  void *v4;
  uint64_t v5;

  if (self->_itemType != 9)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult uniqueRemoteId]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MFIMAPFetchResult.m"), 241, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  return self->_typeSpecific.messageSize;
}

- (void)setUniqueRemoteId:(unint64_t)a3
{
  void *v5;
  uint64_t v6;

  if (self->_itemType != 9)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult setUniqueRemoteId:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MFIMAPFetchResult.m"), 246, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  self->_typeSpecific.messageSize = a3;
}

- (id)flagsArray
{
  void *v4;
  uint64_t v5;

  if (self->_itemType != 10)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult flagsArray]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MFIMAPFetchResult.m"), 252, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  return (id)MFCreateArrayForMessageFlags((uint64_t)self->_typeSpecific.envelope, 1);
}

- (void)setFlagsArray:(id)a3
{
  void *v5;
  uint64_t v6;

  if (self->_itemType != 10)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult setFlagsArray:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MFIMAPFetchResult.m"), 258, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  self->_typeSpecific.messageSize = MFMessageFlagsFromArray(a3);
}

- (void)setMessageFlags:(unint64_t)a3
{
  void *v5;
  uint64_t v6;

  if (self->_itemType != 10)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult setMessageFlags:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MFIMAPFetchResult.m"), 263, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  self->_typeSpecific.messageSize = a3;
}

- (unint64_t)messageFlags
{
  return self->_typeSpecific.messageSize;
}

- (void)setCustomFlagsArray:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;

  if (self->_itemType != 10)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult setCustomFlagsArray:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MFIMAPFetchResult.m"), 272, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  v5 = a3;

  self->_typeSpecific.bodySectionInfo.startOffset = (unint64_t)a3;
}

- (id)customFlagsArray
{
  void *v4;
  uint64_t v5;

  if (self->_itemType != 10)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult customFlagsArray]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MFIMAPFetchResult.m"), 279, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  return self->_typeSpecific.flags.customFlags;
}

- (unint64_t)modSequenceNumber
{
  return self->_modSequenceNumber;
}

- (void)setModSequenceNumber:(unint64_t)a3
{
  self->_modSequenceNumber = a3;
}

- (id)appleRemoteLinks
{
  void *v4;
  uint64_t v5;

  if (self->_itemType != 12)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult appleRemoteLinks]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MFIMAPFetchResult.m"), 292, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  return self->_typeSpecific.envelope;
}

- (void)setAppleRemoteLinks:(id)a3
{
  NSArray *envelope;
  void *v6;
  uint64_t v7;

  if (self->_itemType != 12)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFIMAPFetchResult setAppleRemoteLinks:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MFIMAPFetchResult.m"), 298, CFSTR("Invalid item type %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemType));
  }
  envelope = self->_typeSpecific.envelope;
  if (envelope != a3)
  {

    self->_typeSpecific.messageSize = (unint64_t)a3;
  }
}

- (unsigned)encoding
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = -[MFIMAPFetchResult flagsArray](self, "flagsArray");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v3)
    return -1;
  v4 = v3;
  v5 = *(_QWORD *)v13;
LABEL_3:
  v6 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v5)
      objc_enumerationMutation(v2);
    v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
    if (v7)
    {
      v8 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v6), "rangeOfString:options:", 0x1E4F2A2B8, 9);
      if (v9)
      {
        v10 = v8 + v9;
        if (v8 + v9 < (unint64_t)objc_msgSend(v7, "length"))
        {
          objc_msgSend(v7, "substringFromIndex:", v10);
          result = MFEncodingForCharset();
          if (result != -1)
            return result;
        }
      }
    }
    if (v4 == ++v6)
    {
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        goto LABEL_3;
      return -1;
    }
  }
}

- (id)description
{
  int64_t itemType;
  id result;
  const __CFString *v5;
  unint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  objc_super v20;

  itemType = self->_itemType;
  result = CFSTR("* INVALID *");
  switch(itemType)
  {
    case 0:
      return result;
    case 1:
      v9 = (void *)MEMORY[0x1E0CB3940];
      v17 = -[MFIMAPFetchResult envelope](self, "envelope");
      v10 = CFSTR("ENVELOPE %@");
      goto LABEL_20;
    case 2:
      v11 = (void *)MEMORY[0x1E0CB3940];
      v10 = CFSTR("INTERNALDATE");
      goto LABEL_21;
    case 3:
      v9 = (void *)MEMORY[0x1E0CB3940];
      v17 = -[MFIMAPFetchResult messageSize](self, "messageSize");
      v10 = CFSTR("RFC822.SIZE %u");
      goto LABEL_20;
    case 4:
    case 5:
    case 7:
      v5 = -[MFIMAPFetchResult section](self, "section");
      v6 = -[MFIMAPFetchResult startOffset](self, "startOffset");
      v7 = objc_msgSend(-[MFIMAPFetchResult fetchData](self, "fetchData"), "length");
      v8 = &stru_1E4F1C8F8;
      if (v5)
        v8 = v5;
      if (v6)
        result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BODY[%@]<%lu> {%lu}..."), v8, v6, v7);
      else
        result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BODY[%@] {%lu}..."), v8, v7, v19);
      goto LABEL_22;
    case 6:
      v9 = (void *)MEMORY[0x1E0CB3940];
      v17 = (id)CFCopyDescription(-[MFIMAPFetchResult bodyStructure](self, "bodyStructure"));
      v10 = CFSTR("BODYSTRUCTURE %@");
      goto LABEL_20;
    case 8:
      v9 = (void *)MEMORY[0x1E0CB3940];
      v17 = -[MFIMAPFetchResult uid](self, "uid");
      v10 = CFSTR("UID %u");
      goto LABEL_20;
    case 9:
      v9 = (void *)MEMORY[0x1E0CB3940];
      v17 = -[MFIMAPFetchResult uniqueRemoteId](self, "uniqueRemoteId");
      v10 = CFSTR("X-GM-MSGID %llu");
      goto LABEL_20;
    case 10:
      v12 = -[MFIMAPFetchResult customFlagsArray](self, "customFlagsArray");
      v9 = (void *)MEMORY[0x1E0CB3940];
      v13 = CFSTR(" ");
      v14 = objc_msgSend(-[MFIMAPFetchResult flagsArray](self, "flagsArray"), "componentsJoinedByString:", CFSTR(" "));
      v15 = &stru_1E4F1C8F8;
      if (!objc_msgSend(v12, "count"))
        v13 = &stru_1E4F1C8F8;
      if (objc_msgSend(v12, "count"))
        v15 = (const __CFString *)objc_msgSend(v12, "componentsJoinedByString:", CFSTR(" "));
      v18 = v13;
      v19 = v15;
      v17 = v14;
      v10 = CFSTR("FLAGS (%@%@%@)");
      goto LABEL_20;
    case 11:
      result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MODSEQ %d"), 0, v18, v19);
      goto LABEL_22;
    case 12:
      v16 = (void *)objc_msgSend(-[MFIMAPFetchResult appleRemoteLinks](self, "appleRemoteLinks"), "ef_map:", &__block_literal_global_34);
      v9 = (void *)MEMORY[0x1E0CB3940];
      v17 = objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
      v10 = CFSTR("X-APPLE-REMOTE-LINKS (%@)");
LABEL_20:
      v11 = v9;
LABEL_21:
      result = (id)objc_msgSend(v11, "stringWithFormat:", v10, v17, v18, v19);
LABEL_22:
      if (!result)
        goto LABEL_23;
      return result;
    default:
LABEL_23:
      v20.receiver = self;
      v20.super_class = (Class)MFIMAPFetchResult;
      return -[MFIMAPFetchResult description](&v20, sel_description);
  }
}

uint64_t __32__MFIMAPFetchResult_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0D1EF48], "fullyRedactedStringForString:", objc_msgSend(a2, "absoluteString"));
}

@end
