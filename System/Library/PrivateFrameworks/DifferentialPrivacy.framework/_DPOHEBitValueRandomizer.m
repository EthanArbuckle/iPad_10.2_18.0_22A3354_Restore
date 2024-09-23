@implementation _DPOHEBitValueRandomizer

- (_DPOHEBitValueRandomizer)init
{

  return 0;
}

- (_DPOHEBitValueRandomizer)initWithDimensionality:(unint64_t)a3 epsilon:(double)a4
{
  BOOL v7;
  char v8;
  _DPOHEBitValueRandomizer *v9;
  _DPOHEBitValueRandomizer *v10;
  _DPOHEBitValueRandomizer *v11;
  long double v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t i;
  int v16;
  objc_super v18;

  v7 = isInvalidEpsilon(a4);
  if (a3)
    v8 = v7;
  else
    v8 = 1;
  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_DPOHEBitValueRandomizer;
    v10 = -[_DPOHEBitValueRandomizer init](&v18, sel_init);
    v11 = v10;
    if (v10)
    {
      v10->_epsilon = a4;
      v10->_domainSize = a3;
      v12 = exp(-a4);
      v11->_flipProbability = v12 / (v12 + 1.0);
      v13 = arc4random();
      v11->_rng.__x_[0] = v13;
      v14 = 1;
      for (i = 9; i != 632; ++i)
      {
        v16 = 1812433253 * (v13 ^ (v13 >> 30));
        v13 = v16 + v14;
        *((_DWORD *)&v11->super.isa + i) = i + v16 - 8;
        ++v14;
      }
      v11->_rng.__i_ = 0;
    }
    self = v11;
    v9 = self;
  }

  return v9;
}

+ (id)oheBitValueRandomizerWithDimensionality:(unint64_t)a3 epsilon:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDimensionality:epsilon:", a3, a4);
}

- (id)randomizeWithMessageIndex:(unint64_t)a3 numberOfFlippedBits:(unint64_t)a4
{
  unint64_t domainSize;
  BOOL v5;
  void *v6;
  char v7;
  char v8;
  double v9;
  unint64_t v10;
  void *v11;
  _QWORD *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  int v17;
  unint64_t v18;
  unint64_t v19;

  v18 = a4;
  v19 = a3;
  domainSize = self->_domainSize;
  v5 = domainSize > a3 && domainSize >= a4;
  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v17 = 1065353216;
    if (sampleUniformWithoutReplace<unsigned long,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(&v15, &self->_domainSize, &v18, (uint64_t)&self->_rng))
    {
      std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t)&v15, &v19, &v19);
      v8 = v7;
      std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__erase_unique<unsigned long>(&v15, &v19);
      v9 = uniformRandomProbabilityExcludingOne();
      v10 = *((_QWORD *)&v16 + 1);
      v11 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
      v12 = (_QWORD *)v16;
      if ((_QWORD)v16)
      {
        v13 = (int)(v9 * (double)v10);
        do
        {
          if (objc_msgSend(v11, "length"))
            objc_msgSend(v11, "appendString:", CFSTR(","));
          objc_msgSend(v11, "appendFormat:", CFSTR("%lu"), v12[2]);
          v5 = v13-- != 0;
          if (!v5 && (v8 & 1) != 0)
            objc_msgSend(v11, "appendFormat:", CFSTR(",%lu"), v19);
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
      if (!*((_QWORD *)&v16 + 1) && (v8 & 1) != 0)
        objc_msgSend(v11, "appendFormat:", CFSTR("%lu"), v19);
      v6 = (void *)objc_msgSend(v11, "copy");

    }
    else
    {
      v6 = 0;
    }
    std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::~__hash_table((uint64_t)&v15);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (unint64_t)drawNumberOfFlippedBits
{
  _BYTE v4[40];

  std::binomial_distribution<unsigned long>::param_type::param_type((uint64_t)v4, self->_domainSize, self->_flipProbability);
  return std::binomial_distribution<unsigned long>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((int)v4, (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)&self->_rng, (uint64_t)v4);
}

- (id)randomize:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = objc_msgSend(a3, "unsignedLongValue");
  if (v4 >= self->_domainSize)
  {
    v5 = 0;
  }
  else
  {
    -[_DPOHEBitValueRandomizer randomizeWithMessageIndex:numberOfFlippedBits:](self, "randomizeWithMessageIndex:numberOfFlippedBits:", v4, -[_DPOHEBitValueRandomizer drawNumberOfFlippedBits](self, "drawNumberOfFlippedBits"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { p=%lu ; epsilon=%lf }"),
    v5,
    self->_domainSize,
    *(_QWORD *)&self->_epsilon);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)randomizeStrings:(id)a3 forKey:(id)a4
{
  return 0;
}

- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5
{
  return 0;
}

- (id)randomizeBitValues:(id)a3 forKey:(id)a4
{
  void *v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _DPBitValueRecord *v15;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v19 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  v18 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v17;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isEqualToNumber:", &unk_1E96872D0) & 1) == 0)
        {
          -[_DPOHEBitValueRandomizer randomize:](self, "randomize:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[_DPBitValueRecord initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:]([_DPBitValueRecord alloc], "initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:", v19, objc_msgSend(v13, "shortValue"), v14, 0, 0, v8);
          if (v15)
            objc_msgSend(v18, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v18;
}

- (id).cxx_construct
{
  unsigned int v2;
  uint64_t v3;
  uint64_t i;
  int v5;

  v2 = 5489;
  *((_DWORD *)self + 8) = 5489;
  v3 = 1;
  for (i = 9; i != 632; ++i)
  {
    v5 = 1812433253 * (v2 ^ (v2 >> 30));
    v2 = v5 + v3;
    *((_DWORD *)self + i) = i + v5 - 8;
    ++v3;
  }
  *((_QWORD *)self + 316) = 0;
  return self;
}

@end
