@implementation MFIMAPResponseConsumer

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFIMAPResponseConsumer;
  -[MFIMAPResponseConsumer dealloc](&v3, sel_dealloc);
}

- (void)addConsumer:(id)a3 forSection:(id)a4
{
  const __CFString *v7;
  NSMutableDictionary *consumersBySection;

  if (a4)
    v7 = (const __CFString *)a4;
  else
    v7 = CFSTR("<null>");
  consumersBySection = self->_consumersBySection;
  if (!consumersBySection)
  {
    consumersBySection = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_consumersBySection = consumersBySection;
  }
  if (-[NSMutableDictionary objectForKey:](consumersBySection, "objectForKey:", v7))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 2562, CFSTR("should not register multiple consumers for the same section: %@"), v7);
  -[NSMutableDictionary setObject:forKey:](self->_consumersBySection, "setObject:forKey:", a3, v7);
}

- (void)appendData:(id)a3 forSection:(id)a4
{
  const __CFString *v5;
  void *v6;
  NSObject *v7;

  if (a4)
    v5 = (const __CFString *)a4;
  else
    v5 = CFSTR("<null>");
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_consumersBySection, "objectForKey:", v5);
  if (!v6)
  {
    v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MFIMAPResponseConsumer appendData:forSection:].cold.1((uint64_t)v5, v7);
  }
  objc_msgSend(v6, "appendData:", a3);
}

- (id)consumersBySection
{
  return self->_consumersBySection;
}

- (void)done
{
  objc_msgSend((id)-[NSMutableDictionary allValues](self->_consumersBySection, "allValues"), "makeObjectsPerformSelector:", sel_done);
}

- (void)appendData:(uint64_t)a1 forSection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A4F90000, a2, OS_LOG_TYPE_DEBUG, "server returned data we don't have a consumer for, might be expected for section %@", (uint8_t *)&v2, 0xCu);
}

@end
