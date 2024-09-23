@implementation FTBipartiteMatcher

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (FTBipartiteMatcher)initWithInitialSize:(unint64_t)a3
{
  FTBipartiteMatcher *v4;
  ft::HungarianMatcher *v5;
  ft::HungarianMatcher *value;
  FTBipartiteMatcher *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FTBipartiteMatcher;
  v4 = -[FTBipartiteMatcher init](&v9, sel_init);
  if (v4)
  {
    v5 = (ft::HungarianMatcher *)operator new();
    ft::HungarianMatcher::HungarianMatcher(v5, a3);
    value = (ft::HungarianMatcher *)v4->_optimizer.__ptr_.__value_;
    v4->_optimizer.__ptr_.__value_ = (HungarianMatcher *)v5;
    if (value)
    {
      ft::HungarianMatcher::~HungarianMatcher(value);
      MEMORY[0x212B93F04]();
    }
    v7 = v4;
  }

  return v4;
}

- (FTBipartiteMatcher)init
{
  return -[FTBipartiteMatcher initWithInitialSize:](self, "initWithInitialSize:", 10);
}

- (id)computeMatchingForCostMatrix:(const float *)a3 withRowCount:(unint64_t)a4 columnCount:(unint64_t)a5
{
  _BYTE *v5;
  id v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  _BYTE *v12;
  _BYTE *v13;

  ft::HungarianMatcher::Match((ft::HungarianMatcher *)self->_optimizer.__ptr_.__value_, (float *)a3, a4, a5, &v12);
  v5 = v12;
  if (v12 == v13)
  {
    v7 = 0;
    if (!v12)
      return v7;
LABEL_7:
    v13 = v5;
    operator delete(v5);
    return v7;
  }
  v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v7 = (void *)objc_msgSend(v6, "initWithCapacity:", (v13 - v12) >> 3);
  v8 = v12;
  v9 = v13;
  if (v12 != v13)
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v10);

      ++v8;
    }
    while (v8 != v9);
  }
  v5 = v12;
  if (v12)
    goto LABEL_7;
  return v7;
}

- (void).cxx_destruct
{
  HungarianMatcher *value;

  value = self->_optimizer.__ptr_.__value_;
  self->_optimizer.__ptr_.__value_ = 0;
  if (value)
  {
    ft::HungarianMatcher::~HungarianMatcher((ft::HungarianMatcher *)value);
    JUMPOUT(0x212B93F04);
  }
}

- (void)computeMatchingForCostMatrix:(uint64_t)a1 withRowCount:(NSObject *)a2 columnCount:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v4 = 136315138;
  v5 = v3;
  _os_log_error_impl(&dword_20CC71000, a2, OS_LOG_TYPE_ERROR, "Bipartite matching exception: %s", (uint8_t *)&v4, 0xCu);
}

@end
