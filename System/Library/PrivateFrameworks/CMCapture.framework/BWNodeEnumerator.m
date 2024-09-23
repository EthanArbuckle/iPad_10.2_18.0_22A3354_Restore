@implementation BWNodeEnumerator

- (uint64_t)_updateVisitedCount:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", a2);
    v4 = (void *)objc_msgSend(*(id *)(v2 + 24), "objectForKeyedSubscript:", v3);
    if (v4)
      v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "intValue") + 1);
    else
      v5 = &unk_1E49FA050;
    objc_msgSend(*(id *)(v2 + 24), "setObject:forKeyedSubscript:", v5, v3);
    return objc_msgSend(v5, "unsignedIntegerValue");
  }
  return result;
}

- (BWNodeEnumerator)initWithGraph:(id)a3
{
  BWNodeEnumerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWNodeEnumerator;
  v4 = -[BWNodeEnumerator init](&v6, sel_init);
  if (v4)
  {
    v4->_graph = (BWGraph *)a3;
    v4->_depth = 0;
    v4->_nodeVisitCountMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNodeEnumerator;
  -[BWNodeEnumerator dealloc](&v3, sel_dealloc);
}

+ (void)initialize
{
  objc_opt_class();
}

@end
