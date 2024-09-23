@implementation IMMessagePartDescriptor

- (IMMessagePartDescriptor)initWithMessagePartBody:(id)a3 messagePartIndex:(unint64_t)a4 messagePartRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  IMMessagePartDescriptor *v10;
  uint64_t v11;
  NSAttributedString *messagePartBody;
  objc_super v14;

  length = a5.length;
  location = a5.location;
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMMessagePartDescriptor;
  v10 = -[IMMessagePartDescriptor init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    messagePartBody = v10->_messagePartBody;
    v10->_messagePartBody = (NSAttributedString *)v11;

    v10->_messagePartRange.location = location;
    v10->_messagePartRange.length = length;
    v10->_messagePartIndex = a4;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[IMMessagePartDescriptor isEqualToMessagePart:ignoringRange:](self, "isEqualToMessagePart:ignoringRange:", v4, 0);

  return v5;
}

- (BOOL)isEqualToMessagePart:(id)a3 ignoringRange:(BOOL)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;

  v6 = a3;
  if (a4
    || (v7 = -[IMMessagePartDescriptor messagePartRange](self, "messagePartRange"),
        v9 = v8,
        v11 = 0,
        v7 == objc_msgSend(v6, "messagePartRange"))
    && v9 == v10)
  {
    v12 = -[IMMessagePartDescriptor messagePartIndex](self, "messagePartIndex");
    if (v12 == objc_msgSend(v6, "messagePartIndex"))
    {
      -[IMMessagePartDescriptor messagePartBody](self, "messagePartBody");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "messagePartBody");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v16 = v14;
      v17 = v16;
      if (v15 == v16)
      {
        v11 = 1;
      }
      else
      {
        v11 = 0;
        if (v15 && v16)
          v11 = objc_msgSend(v15, "isEqualToAttributedString:", v16);
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)messagePartGUIDForMessageGUID:(id)a3
{
  id v4;
  IMMessagePartGUID *v5;
  void *v6;
  IMMessagePartGUID *v7;

  v4 = a3;
  v5 = [IMMessagePartGUID alloc];
  +[IMMessagePartDescriptor defaultPrefix](IMMessagePartDescriptor, "defaultPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMMessagePartGUID initWithMessageGUID:prefix:partNumber:](v5, "initWithMessageGUID:prefix:partNumber:", v4, v6, -[IMMessagePartDescriptor messagePartIndex](self, "messagePartIndex"));

  return v7;
}

- (NSArray)links
{
  NSArray *links;
  NSArray **p_links;
  uint64_t v5;
  void *v6;
  void *v7;

  p_links = &self->_links;
  links = self->_links;
  if (!links)
  {
    -[NSAttributedString __im_dataDetectedURLsFromAttributes](self->_messagePartBody, "__im_dataDetectedURLsFromAttributes");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)v5;
    else
      v7 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)p_links, v7);

    links = self->_links;
  }
  return links;
}

- (NSArray)mapLocations
{
  NSArray *mapLocations;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  mapLocations = self->_mapLocations;
  if (!mapLocations)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[IMMessagePartDescriptor links](self, "links");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          +[IMMapURLLocationInfo locationInfoFromURL:](IMMapURLLocationInfo, "locationInfoFromURL:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
    v11 = (NSArray *)objc_msgSend(v4, "copy");
    v12 = self->_mapLocations;
    self->_mapLocations = v11;

    mapLocations = self->_mapLocations;
  }
  return mapLocations;
}

- (NSString)transferGUID
{
  void *v3;
  int v4;
  NSString *v5;
  NSString *transferGUID;

  if (!self->_hasLoadedTransferGUID)
  {
    -[NSAttributedString string](self->_messagePartBody, "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D362F8]);

    if (v4)
    {
      -[NSAttributedString attribute:atIndex:effectiveRange:](self->_messagePartBody, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D36430], 0, 0);
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      transferGUID = self->_transferGUID;
      self->_transferGUID = v5;

    }
    self->_hasLoadedTransferGUID = 1;
  }
  return self->_transferGUID;
}

- (NSArray)fileTransferGUIDsInMessagePartText
{
  NSArray *fileTransferGUIDsInMessagePartText;
  id v4;
  NSUInteger v5;
  NSAttributedString *messagePartBody;
  uint64_t v7;
  id v8;
  NSArray *v9;
  NSArray *v10;
  _QWORD v12[4];
  id v13;

  fileTransferGUIDsInMessagePartText = self->_fileTransferGUIDsInMessagePartText;
  if (!fileTransferGUIDsInMessagePartText)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v5 = -[NSAttributedString length](self->_messagePartBody, "length");
    messagePartBody = self->_messagePartBody;
    v7 = *MEMORY[0x1E0D36430];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_19E2D8E64;
    v12[3] = &unk_1E3FB53D0;
    v13 = v4;
    v8 = v4;
    -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](messagePartBody, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v5, 0, v12);
    objc_msgSend(v8, "array");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_fileTransferGUIDsInMessagePartText;
    self->_fileTransferGUIDsInMessagePartText = v9;

    fileTransferGUIDsInMessagePartText = self->_fileTransferGUIDsInMessagePartText;
  }
  return fileTransferGUIDsInMessagePartText;
}

+ (NSString)defaultPrefix
{
  return (NSString *)CFSTR("p");
}

- (unint64_t)messagePartIndex
{
  return self->_messagePartIndex;
}

- (_NSRange)messagePartRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_messagePartRange.length;
  location = self->_messagePartRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSAttributedString)messagePartBody
{
  return self->_messagePartBody;
}

- (BOOL)hasLoadedTransferGUID
{
  return self->_hasLoadedTransferGUID;
}

- (void)setHasLoadedTransferGUID:(BOOL)a3
{
  self->_hasLoadedTransferGUID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagePartBody, 0);
  objc_storeStrong((id *)&self->_fileTransferGUIDsInMessagePartText, 0);
  objc_storeStrong((id *)&self->_transferGUID, 0);
  objc_storeStrong((id *)&self->_mapLocations, 0);
  objc_storeStrong((id *)&self->_links, 0);
}

@end
