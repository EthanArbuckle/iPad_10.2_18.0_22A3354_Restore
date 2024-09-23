@implementation MRExternalDeviceMessageMetrics

- (MRExternalDeviceMessageMetrics)initWithPath:(id)a3
{
  id v4;
  MRExternalDeviceMessageMetrics *v5;
  uint64_t v6;
  NSString *path;
  NSMutableDictionary *v8;
  NSMutableDictionary *entries;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRExternalDeviceMessageMetrics;
  v5 = -[MRExternalDeviceMessageMetrics init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    path = v5->_path;
    v5->_path = (NSString *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    entries = v5->_entries;
    v5->_entries = v8;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[MRExternalDeviceMessageMetrics write](self, "write");
  v3.receiver = self;
  v3.super_class = (Class)MRExternalDeviceMessageMetrics;
  -[MRExternalDeviceMessageMetrics dealloc](&v3, sel_dealloc);
}

- (void)addMessage:(id)a3 data:(id)a4
{
  objc_class *v5;
  void *v6;
  MRExternalDeviceMessageMetricsEntry *v7;
  id v8;

  v8 = a4;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_entries, "objectForKey:", v6);
  v7 = (MRExternalDeviceMessageMetricsEntry *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(MRExternalDeviceMessageMetricsEntry);
    -[NSMutableDictionary setObject:forKey:](self->_entries, "setObject:forKey:", v7, v6);
  }
  -[MRExternalDeviceMessageMetricsEntry updateWithValue:](v7, "updateWithValue:", objc_msgSend(v8, "length"));

}

- (void)write
{
  id v3;
  NSMutableDictionary *entries;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createFileAtPath:contents:attributes:", self->_path, 0, 0);
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  entries = self->_entries;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__MRExternalDeviceMessageMetrics_write__block_invoke;
  v7[3] = &unk_1E30CA188;
  v8 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](entries, "enumerateKeysAndObjectsUsingBlock:", v7);
  objc_msgSend(v5, "writeToFile:atomically:encoding:error:", self->_path, 1, 4, 0);

}

void __39__MRExternalDeviceMessageMetrics_write__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Type: %@ Entry: %@\n"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
