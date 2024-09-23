@implementation MLMediaTypeCountedSet

- (id)description
{
  void *v3;
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[4];
  id v12;

  if (self->_map.__tree_.__pair3_.__value_)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __36__MLMediaTypeCountedSet_description__block_invoke;
    v11[3] = &unk_1E5B63B50;
    v4 = v3;
    v12 = v4;
    -[MLMediaTypeCountedSet enumerateMediaTypesWithBlock:](self, "enumerateMediaTypesWithBlock:", v11);
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("{ -empty- }");
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)MLMediaTypeCountedSet;
  -[MLMediaTypeCountedSet description](&v10, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ types: %@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)count
{
  return self->_map.__tree_.__pair3_.__value_;
}

- (void)addMediaType:(unsigned int)a3 count:(unint64_t)a4
{
  unsigned int *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *v9;
  unsigned int v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *v11;
  void *v12;
  uint64_t *v13;

  p_pair1 = &self->_map.__tree_.__pair1_;
  left = (unsigned int *)self->_map.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    while (1)
    {
      while (1)
      {
        v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)left;
        v10 = left[8];
        if (v10 <= a3)
          break;
        left = (unsigned int *)v9->__value_.__left_;
        p_pair1 = v9;
        if (!v9->__value_.__left_)
          goto LABEL_9;
      }
      if (v10 >= a3)
        break;
      left = (unsigned int *)v9[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v9 = &self->_map.__tree_.__pair1_;
LABEL_9:
    v11 = v9;
    v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)operator new(0x30uLL);
    LODWORD(v9[4].__value_.__left_) = a3;
    v9[5].__value_.__left_ = 0;
    v9->__value_.__left_ = 0;
    v9[1].__value_.__left_ = 0;
    v9[2].__value_.__left_ = v11;
    p_pair1->__value_.__left_ = v9;
    v12 = *(void **)self->_map.__tree_.__begin_node_;
    v13 = (uint64_t *)v9;
    if (v12)
    {
      self->_map.__tree_.__begin_node_ = v12;
      v13 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_map.__tree_.__pair1_.__value_.__left_, v13);
    ++self->_map.__tree_.__pair3_.__value_;
  }
  v9[5].__value_.__left_ = (char *)v9[5].__value_.__left_ + a4;
}

- (void)enumerateMediaTypesWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, void *, char *);
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *v8;
  BOOL v9;
  char v10;

  v4 = (void (**)(id, _QWORD, void *, char *))a3;
  if (-[MLMediaTypeCountedSet count](self, "count"))
  {
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)self->_map.__tree_.__begin_node_;
    p_pair1 = &self->_map.__tree_.__pair1_;
    if (begin_node != p_pair1)
    {
      do
      {
        v10 = 0;
        v4[2](v4, LODWORD(begin_node[4].__value_.__left_), begin_node[5].__value_.__left_, &v10);
        if (v10)
          break;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)begin_node[1].__value_.__left_;
        if (left)
        {
          do
          {
            v8 = left;
            left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)left->__value_.__left_;
          }
          while (left);
        }
        else
        {
          do
          {
            v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)begin_node[2].__value_.__left_;
            v9 = v8->__value_.__left_ == begin_node;
            begin_node = v8;
          }
          while (!v9);
        }
        begin_node = v8;
      }
      while (v8 != p_pair1);
    }
  }

}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::destroy((_QWORD *)self->_map.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

void __36__MLMediaTypeCountedSet_description__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromMLMediaType(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("count[%@] %@"), v7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

}

@end
