@implementation MRPlaybackQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_resolvedPlayerPath, 0);
  objc_storeStrong((id *)&self->_auxiliaryNowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

- (MRPlaybackQueue)initWithContentItems:(id)a3 location:(unint64_t)a4
{
  MRPlaybackQueue *result;

  result = -[MRPlaybackQueue initWithContentItems:](self, "initWithContentItems:", a3);
  if (result)
  {
    result->_location = a4;
    result->_hasLocation = 1;
  }
  return result;
}

- (MRPlaybackQueue)initWithContentItems:(id)a3
{
  id v4;
  MRPlaybackQueue *v5;
  uint64_t v6;
  NSArray *contentItems;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRPlaybackQueue;
  v5 = -[MRPlaybackQueue init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contentItems = v5->_contentItems;
    v5->_contentItems = (NSArray *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setLocation:", -[MRPlaybackQueue location](self, "location"));
  objc_msgSend(v5, "setHasLocation:", -[MRPlaybackQueue hasLocation](self, "hasLocation"));
  -[MRPlaybackQueue requestIdentifier](self, "requestIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setRequestIdentifier:", v7);

  -[MRPlaybackQueue queueIdentifier](self, "queueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setQueueIdentifier:", v9);

  -[MRPlaybackQueue resolvedPlayerPath](self, "resolvedPlayerPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setResolvedPlayerPath:", v11);

  -[MRPlaybackQueue homeUserIdentifiers](self, "homeUserIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setHomeUserIdentifiers:", v13);

  -[MRPlaybackQueue contentItems](self, "contentItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __32__MRPlaybackQueue_copyWithZone___block_invoke;
  v23[3] = &__block_descriptor_40_e23__16__0__MRContentItem_8l;
  v23[4] = a3;
  objc_msgSend(v14, "mr_map:", v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentItems:", v15);

  -[MRPlaybackQueue properties](self, "properties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setProperties:", v17);

  -[MRPlaybackQueue auxiliaryNowPlayingInfo](self, "auxiliaryNowPlayingInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v5, "setAuxiliaryNowPlayingInfo:", v19);

  -[MRPlaybackQueue context](self, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  objc_msgSend(v5, "setContext:", v21);

  return v5;
}

- (MRPlayerPath)resolvedPlayerPath
{
  return self->_resolvedPlayerPath;
}

- (void)setResolvedPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedPlayerPath, a3);
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (void)setQueueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)homeUserIdentifiers
{
  return self->_homeUserIdentifiers;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

id __32__MRPlaybackQueue_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithZone:", *(_QWORD *)(a1 + 32));
}

- (_MRPlaybackQueueContextProtobuf)context
{
  return self->_context;
}

- (void)setHomeUserIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
  self->_hasLocation = 1;
}

- (void)setHasLocation:(BOOL)a3
{
  self->_hasLocation = a3;
}

- (void)setContentItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)contentItemWithOffset:(unint64_t)a3
{
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;

  if (contentItemWithOffset__onceToken == -1)
  {
    if (!self)
      goto LABEL_8;
  }
  else
  {
    dispatch_once(&contentItemWithOffset__onceToken, &__block_literal_global_33);
    if (!self)
      goto LABEL_8;
  }
  if (contentItemWithOffset__isNano)
    goto LABEL_8;
  -[MRPlaybackQueue contentItems](self, "contentItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = -[MRPlaybackQueue hasLocation](self, "hasLocation");

    if (v6)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRPlaybackQueue contentItemWithOffset:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MRPlaybackQueue.m"), 257, CFSTR("Attempting to set non-range based playbackQueue"));

  }
LABEL_8:
  v8 = -[MRPlaybackQueue location](self, "location");
  if (v8 >= 0)
    v9 = v8;
  else
    v9 = -v8;
  v10 = v9 + a3;
  -[MRPlaybackQueue contentItems](self, "contentItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v10 >= v12)
  {
    v14 = 0;
  }
  else
  {
    -[MRPlaybackQueue contentItems](self, "contentItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (_NSRange)range
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v3 = -[MRPlaybackQueue location](self, "location");
  -[MRPlaybackQueue contentItems](self, "contentItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

- (int64_t)location
{
  return self->_location;
}

- (BOOL)hasLocation
{
  return self->_hasLocation;
}

uint64_t __40__MRPlaybackQueue_protobufWithEncoding___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobufWithEncoding:", *(_QWORD *)(a1 + 32));
}

MRContentItem *__36__MRPlaybackQueue_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRContentItem *v3;

  v2 = a2;
  v3 = -[MRContentItem initWithProtobuf:]([MRContentItem alloc], "initWithProtobuf:", v2);

  return v3;
}

uint64_t __43__MRPlaybackQueue_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

void __41__MRPlaybackQueue_contentItemWithOffset___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  contentItemWithOffset__isNano = objc_msgSend(v0, "containsString:", CFSTR("nanomediaremotelinkagent"));

}

- (MRPlaybackQueue)initWithData:(id)a3
{
  id v4;
  _MRPlaybackQueueProtobuf *v5;
  MRPlaybackQueue *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRPlaybackQueueProtobuf initWithData:]([_MRPlaybackQueueProtobuf alloc], "initWithData:", v4);

    self = -[MRPlaybackQueue initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MRPlaybackQueue)initWithProtobuf:(id)a3
{
  id v4;
  MRPlaybackQueue *v5;
  uint64_t v6;
  _MRPlaybackQueueContextProtobuf *context;
  void *v8;
  uint64_t v9;
  NSString *requestIdentifier;
  void *v11;
  uint64_t v12;
  NSString *queueIdentifier;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSSet *homeUserIdentifiers;
  void *v19;
  uint64_t v20;
  NSArray *contentItems;
  void *v22;
  uint64_t v23;
  NSDictionary *properties;
  void *v25;
  uint64_t v26;
  NSDictionary *auxiliaryNowPlayingInfo;
  MRPlayerPath *v28;
  void *v29;
  uint64_t v30;
  MRPlayerPath *resolvedPlayerPath;
  MRPlaybackQueue *v32;
  objc_super v34;

  v4 = a3;
  if (v4)
  {
    v34.receiver = self;
    v34.super_class = (Class)MRPlaybackQueue;
    v5 = -[MRPlaybackQueue init](&v34, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "context");
      v6 = objc_claimAutoreleasedReturnValue();
      context = v5->_context;
      v5->_context = (_MRPlaybackQueueContextProtobuf *)v6;

      v5->_location = (int)objc_msgSend(v4, "location");
      v5->_hasLocation = objc_msgSend(v4, "hasLocation");
      objc_msgSend(v4, "requestID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      requestIdentifier = v5->_requestIdentifier;
      v5->_requestIdentifier = (NSString *)v9;

      objc_msgSend(v4, "queueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      queueIdentifier = v5->_queueIdentifier;
      v5->_queueIdentifier = (NSString *)v12;

      objc_msgSend(v4, "homeUserIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = objc_alloc(MEMORY[0x1E0C99E60]);
        objc_msgSend(v4, "homeUserIdentifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "initWithArray:", v16);
        homeUserIdentifiers = v5->_homeUserIdentifiers;
        v5->_homeUserIdentifiers = (NSSet *)v17;

      }
      objc_msgSend(v4, "contentItems");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "mr_map:", &__block_literal_global_102);
      v20 = objc_claimAutoreleasedReturnValue();
      contentItems = v5->_contentItems;
      v5->_contentItems = (NSArray *)v20;

      objc_msgSend(v4, "properties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      _MRProtoUtilsNSDictionaryFromProtoDictionary(v22);
      v23 = objc_claimAutoreleasedReturnValue();
      properties = v5->_properties;
      v5->_properties = (NSDictionary *)v23;

      objc_msgSend(v4, "auxiliaryNowPlayingInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      _MRProtoUtilsNSDictionaryFromProtoDictionary(v25);
      v26 = objc_claimAutoreleasedReturnValue();
      auxiliaryNowPlayingInfo = v5->_auxiliaryNowPlayingInfo;
      v5->_auxiliaryNowPlayingInfo = (NSDictionary *)v26;

      if (objc_msgSend(v4, "hasResolvedPlayerPath"))
      {
        v28 = [MRPlayerPath alloc];
        objc_msgSend(v4, "resolvedPlayerPath");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[MRPlayerPath initWithProtobuf:](v28, "initWithProtobuf:", v29);
        resolvedPlayerPath = v5->_resolvedPlayerPath;
        v5->_resolvedPlayerPath = (MRPlayerPath *)v30;

      }
    }
    self = v5;
    v32 = self;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRPlaybackQueue protobufWithEncoding:](self, "protobufWithEncoding:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)protobufWithEncoding:(int64_t)a3
{
  _MRPlaybackQueueProtobuf *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];

  v5 = objc_alloc_init(_MRPlaybackQueueProtobuf);
  -[MRPlaybackQueue context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackQueueProtobuf setContext:](v5, "setContext:", v6);

  -[_MRPlaybackQueueProtobuf setLocation:](v5, "setLocation:", -[MRPlaybackQueue location](self, "location"));
  -[_MRPlaybackQueueProtobuf setHasLocation:](v5, "setHasLocation:", -[MRPlaybackQueue hasLocation](self, "hasLocation"));
  -[MRPlaybackQueue requestIdentifier](self, "requestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[_MRPlaybackQueueProtobuf setRequestID:](v5, "setRequestID:", v8);

  -[MRPlaybackQueue queueIdentifier](self, "queueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[_MRPlaybackQueueProtobuf setQueueIdentifier:](v5, "setQueueIdentifier:", v10);

  -[MRPlaybackQueue resolvedPlayerPath](self, "resolvedPlayerPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "protobuf");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackQueueProtobuf setResolvedPlayerPath:](v5, "setResolvedPlayerPath:", v12);

  -[MRPlaybackQueue homeUserIdentifiers](self, "homeUserIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  -[_MRPlaybackQueueProtobuf setHomeUserIdentifiers:](v5, "setHomeUserIdentifiers:", v15);

  -[MRPlaybackQueue contentItems](self, "contentItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __40__MRPlaybackQueue_protobufWithEncoding___block_invoke;
  v24[3] = &__block_descriptor_40_e47____MRContentItemProtobuf_16__0__MRContentItem_8l;
  v24[4] = a3;
  objc_msgSend(v16, "mr_map:", v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");
  -[_MRPlaybackQueueProtobuf setContentItems:](v5, "setContentItems:", v18);

  -[MRPlaybackQueue properties](self, "properties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _MRProtoUtilsProtoDictionaryFromNSDictionary(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackQueueProtobuf setProperties:](v5, "setProperties:", v20);

  -[MRPlaybackQueue auxiliaryNowPlayingInfo](self, "auxiliaryNowPlayingInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _MRProtoUtilsProtoDictionaryFromNSDictionary(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackQueueProtobuf setAuxiliaryNowPlayingInfo:](v5, "setAuxiliaryNowPlayingInfo:", v22);

  return v5;
}

- (NSString)minimalReadableDescription
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  -[MRPlaybackQueue dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MRPlaybackQueue contentItems](self, "contentItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)MRContentItemsCopyMinimalReadableDescription(v5, 0);

  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("contentItems"));
  objc_msgSend(v4, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[MRPlaybackQueue hasLocation](self, "hasLocation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRPlaybackQueue location](self, "location"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("location"));

  }
  -[MRPlaybackQueue requestIdentifier](self, "requestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("requestIdentifier"));

  -[MRPlaybackQueue queueIdentifier](self, "queueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("queueIdentifier"));

  -[MRPlaybackQueue resolvedPlayerPath](self, "resolvedPlayerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("resolvedPlayerPath"));

  -[MRPlaybackQueue homeUserIdentifiers](self, "homeUserIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("homeUserIdentifiers"));

  -[MRPlaybackQueue contentItems](self, "contentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mr_map:", &__block_literal_global_20_2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("contentItems"));

  -[MRPlaybackQueue properties](self, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("properties"));

  -[MRPlaybackQueue auxiliaryNowPlayingInfo](self, "auxiliaryNowPlayingInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("auxiliaryNowPlayingInfo"));

  return (NSDictionary *)v3;
}

- (id)contentItemForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MRPlaybackQueue contentItems](self, "contentItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id obj;
  uint64_t v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[MRPlaybackQueue contentItems](self, "contentItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v18)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v4);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v17, "contentItems");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v20;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v20 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
              objc_msgSend(v5, "identifier");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "identifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v12, "isEqualToString:", v13);

              if (v14)
                MRContentItemMerge(v5, v11);
              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v8);
        }

        ++v4;
      }
      while (v4 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v18);
  }

}

- (MRPlaybackQueue)initWithContentItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  MRPlaybackQueue *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v9 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[MRPlaybackQueue initWithContentItems:](self, "initWithContentItems:", v6, v9, v10);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MRPlaybackQueue)initWithContentItems:(id)a3 withPropertiesFromPlaybackQueue:(id)a4
{
  id v6;
  MRPlaybackQueue *v7;
  MRPlaybackQueue *v8;

  v6 = a4;
  v7 = -[MRPlaybackQueue initWithContentItems:](self, "initWithContentItems:", a3);
  v8 = v7;
  if (v7)
    -[MRPlaybackQueue mergePropertiesFromPlaybackQueue:](v7, "mergePropertiesFromPlaybackQueue:", v6);

  return v8;
}

- (MRPlaybackQueue)initWithContentItems:(id)a3 location:(unint64_t)a4 withPropertiesFromPlaybackQueue:(id)a5
{
  id v8;
  MRPlaybackQueue *v9;
  MRPlaybackQueue *v10;

  v8 = a5;
  v9 = -[MRPlaybackQueue initWithContentItems:location:](self, "initWithContentItems:location:", a3, a4);
  v10 = v9;
  if (v9)
    -[MRPlaybackQueue mergePropertiesFromPlaybackQueue:](v9, "mergePropertiesFromPlaybackQueue:", v8);

  return v10;
}

- (MRPlaybackQueue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  MRPlaybackQueue *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobuf"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _MRLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MRLanguageOption initWithCoder:].cold.1((uint64_t)v5, v6);

    v5 = 0;
  }
  v7 = -[MRPlaybackQueue initWithProtobuf:](self, "initWithProtobuf:", v5);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRPlaybackQueue protobufWithEncoding:](self, "protobufWithEncoding:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobuf"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)contentItemIdentifiers
{
  void *v2;
  void *v3;

  -[MRPlaybackQueue contentItems](self, "contentItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mr_map:", &__block_literal_global_27);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __41__MRPlaybackQueue_contentItemIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (BOOL)isEqual:(id)a3
{
  MRPlaybackQueue *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;

  v4 = (MRPlaybackQueue *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_30;
    v5 = -[MRPlaybackQueue hasLocation](v4, "hasLocation");
    if (v5 != -[MRPlaybackQueue hasLocation](self, "hasLocation"))
      goto LABEL_30;
    if (-[MRPlaybackQueue hasLocation](v4, "hasLocation"))
    {
      if (-[MRPlaybackQueue hasLocation](self, "hasLocation"))
      {
        v6 = -[MRPlaybackQueue location](v4, "location");
        if (v6 != -[MRPlaybackQueue location](self, "location"))
          goto LABEL_30;
      }
    }
    -[MRPlaybackQueue requestIdentifier](v4, "requestIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackQueue requestIdentifier](self, "requestIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[MRPlaybackQueue requestIdentifier](v4, "requestIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlaybackQueue requestIdentifier](self, "requestIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if (!v12)
        goto LABEL_30;
    }
    -[MRPlaybackQueue queueIdentifier](v4, "queueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackQueue queueIdentifier](self, "queueIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[MRPlaybackQueue queueIdentifier](v4, "queueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlaybackQueue queueIdentifier](self, "queueIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqualToString:", v18);

      if (!v19)
        goto LABEL_30;
    }
    -[MRPlaybackQueue contentItems](v4, "contentItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackQueue contentItems](self, "contentItems");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[MRPlaybackQueue contentItems](v4, "contentItems");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlaybackQueue contentItems](self, "contentItems");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqualToArray:", v24);

      if (!v25)
        goto LABEL_30;
    }
    -[MRPlaybackQueue resolvedPlayerPath](v4, "resolvedPlayerPath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackQueue resolvedPlayerPath](self, "resolvedPlayerPath");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[MRPlaybackQueue resolvedPlayerPath](v4, "resolvedPlayerPath");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlaybackQueue resolvedPlayerPath](self, "resolvedPlayerPath");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_30;
    }
    -[MRPlaybackQueue homeUserIdentifiers](v4, "homeUserIdentifiers");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackQueue homeUserIdentifiers](self, "homeUserIdentifiers");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v32 == (void *)v33)
    {

    }
    else
    {
      v34 = (void *)v33;
      -[MRPlaybackQueue homeUserIdentifiers](v4, "homeUserIdentifiers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlaybackQueue homeUserIdentifiers](self, "homeUserIdentifiers");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqualToSet:", v36);

      if (!v37)
        goto LABEL_30;
    }
    -[MRPlaybackQueue properties](v4, "properties");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackQueue properties](self, "properties");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v38 == (void *)v39)
    {

    }
    else
    {
      v40 = (void *)v39;
      -[MRPlaybackQueue properties](v4, "properties");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlaybackQueue properties](self, "properties");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "isEqualToDictionary:", v42);

      if (!v43)
      {
LABEL_30:
        v13 = 0;
        goto LABEL_31;
      }
    }
    -[MRPlaybackQueue auxiliaryNowPlayingInfo](v4, "auxiliaryNowPlayingInfo");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackQueue auxiliaryNowPlayingInfo](self, "auxiliaryNowPlayingInfo");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v45 == (void *)v46)
    {
      v13 = 1;
      v47 = v45;
    }
    else
    {
      v47 = (void *)v46;
      -[MRPlaybackQueue auxiliaryNowPlayingInfo](v4, "auxiliaryNowPlayingInfo");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlaybackQueue auxiliaryNowPlayingInfo](self, "auxiliaryNowPlayingInfo");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v48, "isEqualToDictionary:", v49);

    }
  }
LABEL_31:

  return v13;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRPlaybackQueue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);

  return v6;
}

- (NSDictionary)nowPlayingInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  -[MRPlaybackQueue contentItemWithOffset:](self, "contentItemWithOffset:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MRPlaybackQueue auxiliaryNowPlayingInfo](self, "auxiliaryNowPlayingInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nowPlayingInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __33__MRPlaybackQueue_nowPlayingInfo__block_invoke;
    v10[3] = &unk_1E30CA498;
    v11 = v6;
    v7 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);
    v8 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = 0;
  }

  return (NSDictionary *)v8;
}

uint64_t __33__MRPlaybackQueue_nowPlayingInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

- (void)mergePropertiesFromPlaybackQueue:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *queueIdentifier;
  void *v8;
  NSDictionary *v9;
  NSDictionary *properties;
  void *v11;
  NSDictionary *v12;
  NSDictionary *auxiliaryNowPlayingInfo;
  void *v14;
  MRPlayerPath *v15;
  MRPlayerPath *resolvedPlayerPath;
  void *v17;
  NSSet *v18;
  NSSet *homeUserIdentifiers;
  void *v20;
  _MRPlaybackQueueContextProtobuf *v21;
  _MRPlaybackQueueContextProtobuf *context;
  NSString *v23;
  NSString *requestIdentifier;
  id v25;

  v4 = a3;
  objc_msgSend(v4, "queueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSString *)objc_msgSend(v5, "copy");
  queueIdentifier = self->_queueIdentifier;
  self->_queueIdentifier = v6;

  objc_msgSend(v4, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSDictionary *)objc_msgSend(v8, "copy");
  properties = self->_properties;
  self->_properties = v9;

  objc_msgSend(v4, "auxiliaryNowPlayingInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSDictionary *)objc_msgSend(v11, "copy");
  auxiliaryNowPlayingInfo = self->_auxiliaryNowPlayingInfo;
  self->_auxiliaryNowPlayingInfo = v12;

  objc_msgSend(v4, "resolvedPlayerPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (MRPlayerPath *)objc_msgSend(v14, "copy");
  resolvedPlayerPath = self->_resolvedPlayerPath;
  self->_resolvedPlayerPath = v15;

  objc_msgSend(v4, "homeUserIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (NSSet *)objc_msgSend(v17, "copy");
  homeUserIdentifiers = self->_homeUserIdentifiers;
  self->_homeUserIdentifiers = v18;

  objc_msgSend(v4, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (_MRPlaybackQueueContextProtobuf *)objc_msgSend(v20, "copy");
  context = self->_context;
  self->_context = v21;

  objc_msgSend(v4, "requestIdentifier");
  v25 = (id)objc_claimAutoreleasedReturnValue();

  v23 = (NSString *)objc_msgSend(v25, "copy");
  requestIdentifier = self->_requestIdentifier;
  self->_requestIdentifier = v23;

}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)auxiliaryNowPlayingInfo
{
  return self->_auxiliaryNowPlayingInfo;
}

- (void)setAuxiliaryNowPlayingInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
