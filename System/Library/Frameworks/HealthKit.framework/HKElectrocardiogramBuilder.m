@implementation HKElectrocardiogramBuilder

- (HKElectrocardiogramBuilder)initWithStartDate:(id)a3 frequency:(id)a4
{
  id v7;
  id v8;
  HKElectrocardiogramBuilder *v9;
  HKElectrocardiogramBuilder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKElectrocardiogramBuilder;
  v9 = -[HKElectrocardiogramBuilder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v10->_frequency, a4);
  }

  return v10;
}

- (void)addValue:(float)a3 lead:(int64_t)a4
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<binarysample::ElectrocardiogramLead_Name, binarysample::ElectrocardiogramLead>, void *>>> *p_pair1;
  char *v6;
  char *left;
  uint64_t **v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<binarysample::ElectrocardiogramLead_Name, binarysample::ElectrocardiogramLead>, void *>>> *v9;
  int v10;
  BOOL v11;
  void **v12;
  uint64_t **v13;
  int v14;
  uint64_t **v15;
  uint64_t **v16;
  float *v17;
  uint64_t v18;
  uint64_t *v19;
  float *v20;
  float *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  float *v27;
  uint64_t *v28;
  int v29;
  int v30;
  int *v31;

  v30 = a4;
  left = (char *)self->_leads.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_leads.__tree_.__pair1_;
  v6 = left;
  v8 = (uint64_t **)&p_pair1[-1];
  if (!left)
    goto LABEL_11;
  v9 = p_pair1;
  do
  {
    v10 = *((_DWORD *)v6 + 8);
    v11 = v10 < (int)a4;
    if (v10 >= (int)a4)
      v12 = (void **)v6;
    else
      v12 = (void **)(v6 + 8);
    if (!v11)
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<binarysample::ElectrocardiogramLead_Name, binarysample::ElectrocardiogramLead>, void *>>> *)v6;
    v6 = (char *)*v12;
  }
  while (*v12);
  if (v9 == p_pair1 || SLODWORD(v9[4].__value_.__left_) > (int)a4)
  {
LABEL_11:
    v31 = &v30;
    v13 = std::__tree<std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>,std::__map_value_compare<binarysample::ElectrocardiogramLead_Name,std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>,std::less<binarysample::ElectrocardiogramLead_Name>,true>,std::allocator<std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>>>::__emplace_unique_key_args<binarysample::ElectrocardiogramLead_Name,std::piecewise_construct_t const&,std::tuple<binarysample::ElectrocardiogramLead_Name const&>,std::tuple<>>((uint64_t **)&p_pair1[-1], &v30, (uint64_t)&std::piecewise_construct, &v31);
    v14 = v30;
    *((_BYTE *)v13 + 100) |= 1u;
    *((_DWORD *)v13 + 24) = v14;
  }
  v31 = &v30;
  v15 = std::__tree<std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>,std::__map_value_compare<binarysample::ElectrocardiogramLead_Name,std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>,std::less<binarysample::ElectrocardiogramLead_Name>,true>,std::allocator<std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>>>::__emplace_unique_key_args<binarysample::ElectrocardiogramLead_Name,std::piecewise_construct_t const&,std::tuple<binarysample::ElectrocardiogramLead_Name const&>,std::tuple<>>(v8, &v30, (uint64_t)&std::piecewise_construct, &v31);
  v16 = v15;
  v17 = (float *)v15[10];
  v18 = (uint64_t)(v15 + 11);
  v19 = v15[11];
  if (v17 >= (float *)v19)
  {
    v21 = (float *)v15[9];
    v22 = v17 - v21;
    if ((unint64_t)(v22 + 1) >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v23 = (char *)v19 - (char *)v21;
    v24 = ((char *)v19 - (char *)v21) >> 1;
    if (v24 <= v22 + 1)
      v24 = v22 + 1;
    if (v23 >= 0x7FFFFFFFFFFFFFFCLL)
      v25 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v25 = v24;
    if (v25)
    {
      v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v18, v25);
      v21 = (float *)v16[9];
      v17 = (float *)v16[10];
    }
    else
    {
      v26 = 0;
    }
    v27 = (float *)&v26[4 * v22];
    v28 = (uint64_t *)&v26[4 * v25];
    *v27 = a3;
    v20 = v27 + 1;
    while (v17 != v21)
    {
      v29 = *((_DWORD *)v17-- - 1);
      *((_DWORD *)v27-- - 1) = v29;
    }
    v16[9] = (uint64_t *)v27;
    v16[10] = (uint64_t *)v20;
    v16[11] = v28;
    if (v21)
      operator delete(v21);
  }
  else
  {
    *v17 = a3;
    v20 = v17 + 1;
  }
  v16[10] = (uint64_t *)v20;
}

- (void)addAverageHeartRate:(id)a3
{
  objc_storeStrong((id *)&self->_averageHeartRate, a3);
}

- (void)addClassification:(unint64_t)a3
{
  self->_classification = a3;
}

- (id)finishWithDevice:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HKElectrocardiogramBuilder *begin_node;
  HKElectrocardiogramBuilder *isa;
  HKElectrocardiogramBuilder *left;
  BOOL v14;
  void *v15;
  void *v16;
  _BYTE v18[48];
  _BYTE v19[8];
  uint64_t v20;
  binarysample::ElectrocardiogramLead **v21;
  char v22;

  v6 = a3;
  v7 = a4;
  binarysample::Electrocardiogram::Electrocardiogram((uint64_t)v19);
  +[HKUnit hertzUnit](HKUnit, "hertzUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBuilder frequency](self, "frequency");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v8);
  v22 |= 1u;
  v20 = v10;

  begin_node = (HKElectrocardiogramBuilder *)self->_leads.__tree_.__begin_node_;
  if (begin_node != (HKElectrocardiogramBuilder *)&self->_leads.__tree_.__pair1_)
  {
    do
    {
      PB::PtrVector<binarysample::ElectrocardiogramLead>::emplace_back<binarysample::ElectrocardiogramLead const>(&v21, (const binarysample::ElectrocardiogramLead *)&begin_node->_classification);
      isa = (HKElectrocardiogramBuilder *)begin_node->_leads.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (HKElectrocardiogramBuilder *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (HKElectrocardiogramBuilder *)begin_node->_leads.__tree_.__pair1_.__value_.__left_;
          v14 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v14);
      }
      begin_node = left;
    }
    while (left != (HKElectrocardiogramBuilder *)&self->_leads.__tree_.__pair1_);
  }
  -[HKElectrocardiogramBuilder startDate](self, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKElectrocardiogram _electrocardiogramWithStartDate:device:metadata:](HKElectrocardiogram, "_electrocardiogramWithStartDate:device:metadata:", v15, v6, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  binarysample::Electrocardiogram::Electrocardiogram((binarysample::Electrocardiogram *)v18, (const binarysample::Electrocardiogram *)v19);
  objc_msgSend(v16, "setReading:", v18);
  binarysample::Electrocardiogram::~Electrocardiogram((binarysample::Electrocardiogram *)v18);
  objc_msgSend(v16, "_setPrivateClassification:", self->_classification);
  objc_msgSend(v16, "_setAverageHeartRate:", self->_averageHeartRate);

  binarysample::Electrocardiogram::~Electrocardiogram((binarysample::Electrocardiogram *)v19);
  return v16;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (HKQuantity)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequency, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_averageHeartRate, 0);
  std::__tree<std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>,std::__map_value_compare<binarysample::ElectrocardiogramLead_Name,std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>,std::less<binarysample::ElectrocardiogramLead_Name>,true>,std::allocator<std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>>>::destroy((uint64_t)&self->_leads, (_QWORD *)self->_leads.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

@end
