@implementation APSMessage

void __27__APSMessage_objectForKey___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)MEMORY[0x1A1AC9000]();
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_autoreleasePoolPop(v2);
}

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *ivarQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__APSMessage_objectForKey___block_invoke;
  block[3] = &unk_1E3C8BF90;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(ivarQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)guid
{
  return -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSMessageGUID"));
}

- (void)setIdentifier:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSMessageIdentifier"));

}

- (APSMessage)initWithTopic:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  APSMessage *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *plist;
  dispatch_queue_t v12;
  OS_dispatch_queue *ivarQueue;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("null topic"));
    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("null userInfo"));
LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)APSMessage;
  v9 = -[APSMessage init](&v15, sel_init);
  if (v9)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    plist = v9->_plist;
    v9->_plist = v10;

    v12 = dispatch_queue_create("APSMessage-ivarQueue", 0);
    ivarQueue = v9->_ivarQueue;
    v9->_ivarQueue = (OS_dispatch_queue *)v12;

    -[APSMessage setTopic:](v9, "setTopic:", v6);
    -[APSMessage setUserInfo:](v9, "setUserInfo:", v8);
  }

  return v9;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *ivarQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  APSMessage *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__APSMessage_setObject_forKey___block_invoke;
  block[3] = &unk_1E3C8B7B0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(ivarQueue, block);

}

- (void)setUserInfo:(id)a3
{
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("APSMessageUserInfo"));
}

- (void)setTopic:(id)a3
{
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("APSMessageTopic"));
}

void __31__APSMessage_setObject_forKey___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1A1AC9000]();
  v3 = a1[4];
  if (v3)
  {
    objc_msgSend(*(id *)(a1[5] + 8), "setObject:forKey:", v3, a1[6]);
  }
  else if (a1[6])
  {
    objc_msgSend(*(id *)(a1[5] + 8), "removeObjectForKey:");
  }
  objc_autoreleasePoolPop(v2);
}

- (void)setGuid:(id)a3
{
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("APSMessageGUID"));
}

- (void)setCorrelationIdentifier:(id)a3
{
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("APSMessageCorrelationIdentifier"));
}

- (NSString)correlationIdentifier
{
  return (NSString *)-[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSMessageCorrelationIdentifier"));
}

- (NSString)topic
{
  return (NSString *)-[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSMessageTopic"));
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)-[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSMessageUserInfo"));
}

- (unint64_t)identifier
{
  void *v2;
  unint64_t v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSMessageIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_plist, 0);
}

- (APSMessage)initWithDictionary:(id)a3 xpcMessage:(id)a4
{
  id v6;
  id v7;
  APSMessage *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *plist;
  dispatch_queue_t v11;
  OS_dispatch_queue *ivarQueue;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)APSMessage;
  v8 = -[APSMessage init](&v14, sel_init);
  if (v8)
  {
    if (v6)
      v9 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
    else
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    plist = v8->_plist;
    v8->_plist = v9;

    if (v7)
      v8->_xpcMessage = v7;
    v11 = dispatch_queue_create("APSMessage-ivarQueue", 0);
    ivarQueue = v8->_ivarQueue;
    v8->_ivarQueue = (OS_dispatch_queue *)v11;

  }
  return v8;
}

void __38__APSMessage_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)dictionaryRepresentation
{
  NSObject *ivarQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__APSMessage_dictionaryRepresentation__block_invoke;
  v5[3] = &unk_1E3C8B568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (APSMessage)initWithDictionary:(id)a3
{
  return -[APSMessage initWithDictionary:xpcMessage:](self, "initWithDictionary:xpcMessage:", a3, 0);
}

- (APSMessage)initWithCoder:(id)a3
{
  id v4;
  APSMessage *v5;
  uint64_t v6;
  NSMutableDictionary *plist;
  dispatch_queue_t v8;
  OS_dispatch_queue *ivarQueue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APSMessage;
  v5 = -[APSMessage init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("plist"));
    v6 = objc_claimAutoreleasedReturnValue();
    plist = v5->_plist;
    v5->_plist = (NSMutableDictionary *)v6;

    v8 = dispatch_queue_create("APSMessage-ivarQueue", 0);
    ivarQueue = v5->_ivarQueue;
    v5->_ivarQueue = (OS_dispatch_queue *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *ivarQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  ivarQueue = self->_ivarQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__APSMessage_encodeWithCoder___block_invoke;
  v6[3] = &unk_1E3C8B568;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(ivarQueue, v6);
  objc_msgSend(v4, "encodeObject:forKey:", v8[5], CFSTR("plist"));
  _Block_object_dispose(&v7, 8);

}

void __30__APSMessage_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)sendRTT
{
  void *v2;
  unint64_t v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSMessageRTT"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (void)setSendRTT:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSMessageRTT"));

}

- (id)instanceObjectForKey:(id)a3
{
  id v4;
  NSObject *ivarQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__APSMessage_instanceObjectForKey___block_invoke;
  block[3] = &unk_1E3C8BF90;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(ivarQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __35__APSMessage_instanceObjectForKey___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)MEMORY[0x1A1AC9000]();
  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_autoreleasePoolPop(v2);
}

- (void)setInstanceObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *ivarQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  APSMessage *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__APSMessage_setInstanceObject_forKey___block_invoke;
  block[3] = &unk_1E3C8B7B0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(ivarQueue, block);

}

void __39__APSMessage_setInstanceObject_forKey___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)MEMORY[0x1A1AC9000]();
  v3 = a1[4];
  if (v3)
  {
    v4 = *(void **)(a1[5] + 16);
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v6 = a1[5];
      v7 = *(void **)(v6 + 16);
      *(_QWORD *)(v6 + 16) = v5;

      v3 = a1[4];
      v4 = *(void **)(a1[5] + 16);
    }
    objc_msgSend(v4, "setObject:forKey:", v3, a1[6]);
  }
  else if (a1[6])
  {
    objc_msgSend(*(id *)(a1[5] + 16), "removeObjectForKey:");
  }
  objc_autoreleasePoolPop(v2);
}

@end
