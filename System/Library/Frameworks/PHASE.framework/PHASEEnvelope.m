@implementation PHASEEnvelope

- (PHASEEnvelope)init
{
  -[PHASEEnvelope doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEEnvelope)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEEnvelope)initWithStartPoint:(simd_double2)startPoint segments:(NSArray *)segments
{
  NSArray *v6;
  id v7;
  unint64_t v8;
  void *v9;
  void **v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  __int128 *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  double *v21;
  __int128 *v22;
  Phase::Logger *v23;
  PHASENumericPair *v24;
  void *v25;
  PHASENumericPair *v26;
  double v27;
  uint64_t v28;
  void *v29;
  PHASEEnvelope *v30;
  simd_double2 v32;
  double *v33;
  __int128 *v34;
  unint64_t v35;
  simd_double2 v36;
  objc_super v37;
  _QWORD v38[3];
  _QWORD *v39;
  void **v40;
  uint64_t v41;
  _QWORD v42[3];
  _QWORD *v43;
  uint64_t v44;

  v32 = startPoint;
  v44 = *MEMORY[0x24BDAC8D0];
  v6 = segments;
  v37.receiver = self;
  v37.super_class = (Class)PHASEEnvelope;
  v7 = -[PHASEEnvelope init](&v37, sel_init);
  if (v7)
  {
    v8 = 0;
    v36 = v32;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    while (1)
    {
      if (-[NSArray count](v6, "count", *(_OWORD *)&v32) <= v8)
      {
        v21 = v33;
        v22 = v34;
        v23 = (Phase::Logger *)operator new();
        Phase::Envelope<double>::Envelope<std::__wrap_iter<Phase::Envelope<double>::Segment *>>(v23, (uint64_t)&v36, v21, v22);
        v40 = 0;
        std::unique_ptr<Phase::Envelope<double>>::reset[abi:ne180100]((void ***)v7 + 7, (void **)v23);
        std::unique_ptr<Phase::Envelope<double>>::reset[abi:ne180100](&v40, 0);
        *((simd_double2 *)v7 + 1) = v32;
        objc_storeStrong((id *)v7 + 4, segments);
        v24 = -[PHASENumericPair initWithFirstValue:secondValue:]([PHASENumericPair alloc], "initWithFirstValue:secondValue:", ***((double ***)v7 + 7), *(double *)(*(_QWORD *)(*((_QWORD *)v7 + 7) + 8) - 48));
        v25 = (void *)*((_QWORD *)v7 + 5);
        *((_QWORD *)v7 + 5) = v24;

        v26 = [PHASENumericPair alloc];
        v27 = Phase::Envelope<double>::Range(*((uint64_t **)v7 + 7));
        Phase::Envelope<double>::Range(*((uint64_t **)v7 + 7));
        v28 = -[PHASENumericPair initWithFirstValue:secondValue:](v26, "initWithFirstValue:secondValue:", v27);
        v29 = (void *)*((_QWORD *)v7 + 6);
        *((_QWORD *)v7 + 6) = v28;

        v40 = (void **)&v33;
        std::vector<Phase::Envelope<double>::Segment,std::allocator<Phase::Envelope<double>::Segment>>::__destroy_vector::operator()[abi:ne180100](&v40);
        break;
      }
      v40 = 0;
      v41 = 0;
      v42[0] = &off_24D576F70;
      v43 = v42;
      -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endPoint");
      v40 = v10;

      -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "endPoint");
      v41 = v12;

      -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      Phase::Controller::GetCurveFunctionFromCurveType<double>((Phase::Logger *)objc_msgSend(v13, "curveType"), v38);
      std::__function::__value_func<double ()(double)>::operator=[abi:ne180100](v42, (uint64_t)v38);
      v14 = v39;
      if (v39 == v38)
      {
        v14 = v38;
        v15 = 4;
      }
      else
      {
        if (!v39)
          goto LABEL_9;
        v15 = 5;
      }
      (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_9:

      v16 = v34;
      if ((unint64_t)v34 >= v35)
      {
        v18 = std::vector<Phase::Envelope<double>::Segment,std::allocator<Phase::Envelope<double>::Segment>>::__push_back_slow_path<Phase::Envelope<double>::Segment const&>((uint64_t *)&v33, &v40);
        goto LABEL_17;
      }
      *(_QWORD *)v34 = v40;
      *((_QWORD *)v16 + 1) = v41;
      v17 = (uint64_t)v43;
      if (v43)
      {
        if (v43 == v42)
        {
          *((_QWORD *)v16 + 5) = v16 + 1;
          (*(void (**)(_QWORD *))(*v43 + 24))(v43);
          goto LABEL_16;
        }
        v17 = (*(uint64_t (**)(void))(*v43 + 16))();
      }
      *((_QWORD *)v16 + 5) = v17;
LABEL_16:
      v18 = (uint64_t)(v16 + 3);
LABEL_17:
      v34 = (__int128 *)v18;
      v19 = v43;
      if (v43 == v42)
      {
        v19 = v42;
        v20 = 4;
      }
      else
      {
        if (!v43)
          goto LABEL_22;
        v20 = 5;
      }
      (*(void (**)(void))(*v19 + 8 * v20))();
LABEL_22:
      ++v8;
    }
  }
  v30 = (PHASEEnvelope *)v7;

  return v30;
}

- (double)evaluateForValue:(double)x
{
  return Phase::Envelope<double>::operator()((double **)self->_envelope.__ptr_.__value_, x);
}

- (simd_double2)startPoint
{
  return *(simd_double2 *)self->_startPoint;
}

- (NSArray)segments
{
  return self->_segments;
}

- (PHASENumericPair)domain
{
  return self->_domain;
}

- (PHASENumericPair)range
{
  return self->_range;
}

- (void).cxx_destruct
{
  std::unique_ptr<Phase::Envelope<double>>::reset[abi:ne180100]((void ***)&self->_envelope, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_segments, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
