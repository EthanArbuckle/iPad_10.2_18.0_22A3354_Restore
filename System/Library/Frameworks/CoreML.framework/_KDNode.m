@implementation _KDNode

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *__p;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[_KDNode splitIndex](self, "splitIndex"), CFSTR("splitIndex"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_KDNode splitDimension](self, "splitDimension"), CFSTR("splitDimension"));
  *(float *)&v5 = (float)-[_KDNode splitDimension](self, "splitDimension");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("splitValue"), v5);
  objc_msgSend(v4, "encodeInteger:forKey:", -[_KDNode startingIndex](self, "startingIndex"), CFSTR("startingIndex"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_KDNode count](self, "count"), CFSTR("count"));
  -[_KDNode rightChild](self, "rightChild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("rightChild"));

  -[_KDNode leftChild](self, "leftChild");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("leftChild"));

  -[_KDNode boundingBox](self, "boundingBox");
  v11 = 0;
  v12 = 0;
  v13 = 0;
  std::vector<_KDInterval>::__init_with_size[abi:ne180100]<_KDInterval*,_KDInterval*>(&v11, __p, v10, (v10 - (uint64_t)__p) >> 3);
  if (__p)
    operator delete(__p);
  v8 = v11;
  objc_msgSend(v4, "encodeBytes:length:forKey:", v11, v12 - (_QWORD)v11, CFSTR("intervals"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_KDNode isLeaf](self, "isLeaf"), CFSTR("isLeaf"));
  if (v8)
    operator delete(v8);

}

- (_KDNode)initWithCoder:(id)a3
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const void *v12;
  void *v13;
  char *v14;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_KDNode;
  v5 = -[_KDNode init](&v24, sel_init);
  if (v5)
  {
    *((_QWORD *)v5 + 3) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("splitIndex"));
    *((_QWORD *)v5 + 2) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("splitDimension"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("splitValue"));
    *((_DWORD *)v5 + 3) = v6;
    *((_QWORD *)v5 + 4) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("startingIndex"));
    *((_QWORD *)v5 + 5) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rightChild"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("leftChild"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v9;

    v23 = 0;
    v11 = objc_retainAutorelease(v4);
    v12 = (const void *)objc_msgSend(v11, "decodeBytesForKey:returnedLength:", CFSTR("intervals"), &v23);
    v21 = 0;
    v22 = 0;
    v20 = 0;
    std::vector<_KDInterval>::__init_with_size[abi:ne180100]<_KDInterval*,_KDInterval*>(&v20, v12, (uint64_t)v12 + (v23 & 0xFFFFFFFFFFFFFFF8), v23 >> 3);
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v13 = v20;
    std::vector<_KDInterval>::__init_with_size[abi:ne180100]<_KDInterval*,_KDInterval*>(&v16, v20, v21, (v21 - (uint64_t)v20) >> 3);
    v14 = v16;
    std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>((char *)v5 + 64, v16, v17, (v17 - (uint64_t)v16) >> 3);
    *((_QWORD *)v5 + 11) = v19;
    if (v14)
      operator delete(v14);
    *((_BYTE *)v5 + 8) = objc_msgSend(v11, "decodeBoolForKey:", CFSTR("isLeaf"));
    if (v13)
      operator delete(v13);
  }

  return (_KDNode *)v5;
}

- (void)findMin:(float *)a3 andMax:(float *)a4 alongDimension:(unint64_t)a5 data:(const float *)a6 indices:(const unint64_t *)a7 numDimensions:(unint64_t)a8
{
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  float v19;
  float v20;

  v15 = -[_KDNode startingIndex](self, "startingIndex");
  v16 = -[_KDNode count](self, "count");
  v17 = a5 + a7[v15] * a8;
  v18 = v15 + v16 - 1;
  *a3 = a6[v17];
  v19 = a6[v17];
  *a4 = v19;
  while (v15 <= v18)
  {
    v20 = a6[a5 + a7[v15] * a8];
    if (v20 < *a3)
    {
      *a3 = v20;
      v19 = *a4;
    }
    if (v20 > v19)
    {
      *a4 = v20;
      v19 = v20;
    }
    ++v15;
  }
}

- (void)partitionDataPoints:(const float *)a3 indices:(unint64_t *)a4 numDimensions:(unint64_t)a5
{
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  float v12;
  float v13;
  unint64_t v14;
  float v15;
  float v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  float v22;
  float v23;
  unint64_t v24;
  float v25;
  float v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v9 = -[_KDNode startingIndex](self, "startingIndex");
  v10 = v9 + -[_KDNode count](self, "count") - 1;
  while (v9 <= v10)
  {
    v11 = a4[v9];
    v12 = a3[-[_KDNode splitDimension](self, "splitDimension") + v11 * a5];
    -[_KDNode splitValue](self, "splitValue");
    if (v12 >= v13)
    {
      v14 = a4[v10];
      v15 = a3[-[_KDNode splitDimension](self, "splitDimension") + v14 * a5];
      -[_KDNode splitValue](self, "splitValue");
      if (v15 < v16)
      {
        v17 = a4[v9];
        a4[v9] = a4[v10];
        a4[v10] = v17;
        ++v9;
      }
      --v10;
    }
    else
    {
      ++v9;
    }
  }
  v18 = -[_KDNode startingIndex](self, "startingIndex");
  v19 = v18 + -[_KDNode count](self, "count") - 1;
  v20 = v9;
  if (v9 <= v19)
  {
    v20 = v9;
    do
    {
      v21 = a4[v20];
      v22 = a3[-[_KDNode splitDimension](self, "splitDimension") + v21 * a5];
      -[_KDNode splitValue](self, "splitValue");
      if (v22 <= v23)
      {
        ++v20;
      }
      else
      {
        v24 = a4[v19];
        v25 = a3[-[_KDNode splitDimension](self, "splitDimension") + v24 * a5];
        -[_KDNode splitValue](self, "splitValue");
        if (v25 < v26)
        {
          v27 = a4[v20];
          a4[v20] = a4[v19];
          a4[v19] = v27;
          ++v20;
        }
        --v19;
      }
    }
    while ((uint64_t)v20 <= v19);
  }
  if (v9 == -[_KDNode startingIndex](self, "startingIndex") && v20 == -[_KDNode startingIndex](self, "startingIndex"))
    goto LABEL_25;
  if (v9 == -[_KDNode startingIndex](self, "startingIndex")
    && (v28 = -[_KDNode startingIndex](self, "startingIndex"), v20 == -[_KDNode count](self, "count") + v28)
    || (v29 = -[_KDNode startingIndex](self, "startingIndex"), v9 == -[_KDNode count](self, "count") + v29)
    && (v30 = -[_KDNode startingIndex](self, "startingIndex"), v20 == -[_KDNode count](self, "count") + v30)
    || v9 <= -[_KDNode count](self, "count") >> 1 && (v9 = v20, v20 >= -[_KDNode count](self, "count") >> 1))
  {
    v20 = -[_KDNode startingIndex](self, "startingIndex");
LABEL_25:
    v9 = v20 + (-[_KDNode count](self, "count") >> 1);
  }
  -[_KDNode setSplitIndex:](self, "setSplitIndex:", v9);
}

- (void)assignSplitsForData:(const float *)a3 indices:(unint64_t *)a4 numDimensions:(unint64_t)a5
{
  float *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  float *v13;
  float v14;
  float v15;
  unsigned int v16;
  float v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  uint64_t v21;
  unint64_t v22;
  float v23;
  float v24;
  float v25;
  double v26;
  float *__p;
  float *v28;
  unint64_t v29;
  unint64_t v30;

  -[_KDNode boundingBox](self, "boundingBox");
  v9 = __p;
  if (v28 == __p)
  {
    v11 = 0;
    v18 = 0;
    v30 = 0;
    v9 = v28;
    if (!v28)
      goto LABEL_11;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = ((char *)v28 - (char *)__p) >> 3;
    if (v12 <= 1)
      v12 = 1;
    v13 = __p + 1;
    v14 = 0.0;
    v15 = -INFINITY;
    v16 = 0;
    do
    {
      v17 = vabds_f32(*v13, *(v13 - 1));
      if (v17 > v15)
      {
        v11 = v10;
        v15 = v17;
        v16 = *((_DWORD *)v13 - 1);
        v14 = *v13;
      }
      ++v10;
      v13 += 2;
    }
    while (v12 != v10);
    v30 = __PAIR64__(v16, LODWORD(v14));
  }
  operator delete(v9);
  v18 = v11;
LABEL_11:
  -[_KDNode findMin:andMax:alongDimension:data:indices:numDimensions:](self, "findMin:andMax:alongDimension:data:indices:numDimensions:", (char *)&v30 + 4, &v30, v18, a3, a4, a5);
  v19 = v30;
  -[_KDNode setSplitDimension:](self, "setSplitDimension:", v18);
  *(float *)&v20 = (float)(*((float *)&v30 + 1) + *(float *)&v30) * 0.5;
  -[_KDNode setSplitValue:](self, "setSplitValue:", v20);
  if (a5)
  {
    v21 = 0;
    v22 = 0;
    v23 = vabds_f32(*(float *)&v19, *((float *)&v19 + 1));
    while (v22 == -[_KDNode splitDimension](self, "splitDimension"))
    {
LABEL_22:
      ++v22;
      v21 += 2;
      if (a5 == v22)
        goto LABEL_23;
    }
    -[_KDNode boundingBox](self, "boundingBox");
    if (v29 >= v22)
    {
      v24 = vabds_f32(__p[v21 + 1], __p[v21]);
    }
    else
    {
      v24 = 0.0;
      if (!__p)
        goto LABEL_19;
    }
    operator delete(__p);
LABEL_19:
    if (v24 > v23)
    {
      -[_KDNode findMin:andMax:alongDimension:data:indices:numDimensions:](self, "findMin:andMax:alongDimension:data:indices:numDimensions:", (char *)&v30 + 4, &v30, v22, a3, a4, a5);
      v25 = vabds_f32(*(float *)&v30, *((float *)&v30 + 1));
      if (v25 > v23)
      {
        -[_KDNode setSplitDimension:](self, "setSplitDimension:", v22);
        *(float *)&v26 = (float)(*(float *)&v30 + *((float *)&v30 + 1)) * 0.5;
        -[_KDNode setSplitValue:](self, "setSplitValue:", v26);
        v23 = v25;
      }
    }
    goto LABEL_22;
  }
LABEL_23:
  -[_KDNode partitionDataPoints:indices:numDimensions:](self, "partitionDataPoints:indices:numDimensions:", a3, a4, a5);
}

- (void)print
{
  unint64_t v3;
  float v4;

  v3 = -[_KDNode splitDimension](self, "splitDimension");
  -[_KDNode splitValue](self, "splitValue");
  printf("Splitting node along dimension %lu, by value %.4f", v3, v4);
  printf("\tFound split index %lu\n", -[_KDNode splitIndex](self, "splitIndex"));
}

- (unint64_t)splitDimension
{
  return self->_splitDimension;
}

- (void)setSplitDimension:(unint64_t)a3
{
  self->_splitDimension = a3;
}

- (unint64_t)splitIndex
{
  return self->_splitIndex;
}

- (void)setSplitIndex:(unint64_t)a3
{
  self->_splitIndex = a3;
}

- (float)splitValue
{
  return self->_splitValue;
}

- (void)setSplitValue:(float)a3
{
  self->_splitValue = a3;
}

- (unint64_t)startingIndex
{
  return self->_startingIndex;
}

- (void)setStartingIndex:(unint64_t)a3
{
  self->_startingIndex = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (_KDNode)leftChild
{
  return self->_leftChild;
}

- (void)setLeftChild:(id)a3
{
  objc_storeStrong((id *)&self->_leftChild, a3);
}

- (_KDNode)rightChild
{
  return self->_rightChild;
}

- (void)setRightChild:(id)a3
{
  objc_storeStrong((id *)&self->_rightChild, a3);
}

- (_KDBoundingBox)boundingBox
{
  _KDBoundingBox *result;

  _KDBoundingBox::_KDBoundingBox(retstr, &self->_boundingBox);
  return result;
}

- (void)setBoundingBox:(_KDBoundingBox *)a3
{
  char *p_boundingBox;

  p_boundingBox = (char *)&self->_boundingBox;
  if (p_boundingBox != (char *)a3)
    std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>(p_boundingBox, (char *)a3->_intervals.__begin_, (uint64_t)a3->_intervals.__end_, (a3->_intervals.__end_ - a3->_intervals.__begin_) >> 3);
  self->_boundingBox._numDimensions = a3->_numDimensions;
}

- (BOOL)isLeaf
{
  return self->_isLeaf;
}

- (void)setIsLeaf:(BOOL)a3
{
  self->_isLeaf = a3;
}

- (void).cxx_destruct
{
  _KDInterval *begin;

  begin = self->_boundingBox._intervals.__begin_;
  if (begin)
  {
    self->_boundingBox._intervals.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_rightChild, 0);
  objc_storeStrong((id *)&self->_leftChild, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
