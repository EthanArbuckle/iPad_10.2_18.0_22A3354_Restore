@implementation _DPPiRapporAlgorithm

- (_DPPiRapporAlgorithm)init
{

  return 0;
}

- (_DPPiRapporAlgorithm)initWithNumberOfClasses:(unint64_t)a3 prime:(unsigned int)a4 alpha0:(double)a5 alpha1:(double)a6
{
  _DPPiRapporAlgorithm *v6;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _DPPiRapporAlgorithm *v28;
  double v29;
  unsigned int v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _DPPiRapporAlgorithm *v41;
  uint64_t v43;
  _DPBiasedCoin *coin;
  objc_super v45;

  v6 = self;
  if (!a3)
  {
    +[_DPLog framework](_DPLog, "framework", 0, *(_QWORD *)&a4, a5, a6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_DPPiRapporAlgorithm initWithNumberOfClasses:prime:alpha0:alpha1:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_29;
  }
  if (a4 > 1)
  {
    if (a5 <= 0.0 || a5 >= 1.0)
    {
      +[_DPLog framework](_DPLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_DPPiRapporAlgorithm initWithNumberOfClasses:prime:alpha0:alpha1:].cold.3(v9, v19, v20, v21, v22, v23, v24, v25);
LABEL_29:

      goto LABEL_30;
    }
    if (a6 <= 0.0 || a6 >= 1.0)
    {
      +[_DPLog framework](_DPLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_DPPiRapporAlgorithm initWithNumberOfClasses:prime:alpha0:alpha1:].cold.4(v9, v32, v33, v34, v35, v36, v37, v38);
      goto LABEL_29;
    }
    if (a5 >= a6)
    {
      +[_DPLog framework](_DPLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_DPPiRapporAlgorithm initWithNumberOfClasses:prime:alpha0:alpha1:].cold.7(v9, a5, a6, v39, v40);
      goto LABEL_29;
    }
    v45.receiver = self;
    v45.super_class = (Class)_DPPiRapporAlgorithm;
    v28 = -[_DPPiRapporAlgorithm init](&v45, sel_init);
    v6 = v28;
    if (v28)
    {
      v28->_numberOfClasses = a3;
      v28->_prime = a4;
      v28->_alpha0 = a5;
      v28->_alpha1 = a6;
      v29 = log((double)a3);
      v6->_numberOfOtherPhi = vcvtpd_u64_f64(v29 / log((double)a4));
      v30 = vcvtpd_u64_f64((double)a4 * a5);
      v6->_threshold = v30;
      if (v30)
        v31 = v30 >= a4;
      else
        v31 = 1;
      if (v31)
      {
        +[_DPLog framework](_DPLog, "framework");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[_DPPiRapporAlgorithm initWithNumberOfClasses:prime:alpha0:alpha1:].cold.6(a4, v8, a5);
        goto LABEL_5;
      }
      +[_DPBiasedCoin coinWithBias:](_DPBiasedCoin, "coinWithBias:", a6);
      v43 = objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        +[_DPLog framework](_DPLog, "framework");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[_DPPiRapporAlgorithm initWithNumberOfClasses:prime:alpha0:alpha1:].cold.5(v9);
        goto LABEL_29;
      }
      coin = v6->_coin;
      v6->_coin = (_DPBiasedCoin *)v43;

    }
    v6 = v6;
    v41 = v6;
    goto LABEL_31;
  }
  +[_DPLog framework](_DPLog, "framework", a5, a6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[_DPPiRapporAlgorithm initWithNumberOfClasses:prime:alpha0:alpha1:].cold.2(a4, v8);
LABEL_5:

LABEL_30:
  v41 = 0;
LABEL_31:

  return v41;
}

+ (id)piRapporWithNumberOfClasses:(unint64_t)a3 prime:(unsigned int)a4 alpha0:(double)a5 alpha1:(double)a6
{
  return -[_DPPiRapporAlgorithm initWithNumberOfClasses:prime:alpha0:alpha1:]([_DPPiRapporAlgorithm alloc], "initWithNumberOfClasses:prime:alpha0:alpha1:", a3, *(_QWORD *)&a4, a5, a6);
}

- (id)encodeClassIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPPiRapporAlgorithm encodeClassIndices:](self, "encodeClassIndices:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)encodeClassIndices:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  void *context;

  v4 = a3;
  v5 = 4 * objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v5 * -[_DPPiRapporAlgorithm numberOfOtherPhi](self, "numberOfOtherPhi"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v32, "bytes");
  v9 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v9, "bytes");
  context = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * -[_DPPiRapporAlgorithm numberOfOtherPhi](self, "numberOfOtherPhi"));
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "bytes");
  if (objc_msgSend(v4, "count"))
  {
    v13 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntegerValue");

      if (v15 >= -[_DPPiRapporAlgorithm numberOfClasses](self, "numberOfClasses"))
        break;
      if (!-[_DPPiRapporAlgorithm encodeClassIndex:coeffs:phi0Buf:otherPhiBuf:](self, "encodeClassIndex:coeffs:phi0Buf:otherPhiBuf:", v15, v12, v8, v10 + 4 * -[_DPPiRapporAlgorithm numberOfOtherPhi](self, "numberOfOtherPhi") * v13))
      {
        +[_DPLog framework](_DPLog, "framework");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[_DPPiRapporAlgorithm encodeClassIndices:].cold.1(v15, v18, v25, v26, v27, v28, v29, v30);
        goto LABEL_11;
      }
      ++v13;
      v8 += 4;
      if (v13 >= objc_msgSend(v4, "count"))
        goto LABEL_6;
    }
    +[_DPLog framework](_DPLog, "framework");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[_DPPiRapporAlgorithm encodeClassIndices:].cold.2(v15, v18, v19, v20, v21, v22, v23, v24);
LABEL_11:
    v16 = v32;

    objc_autoreleasePoolPop(context);
    v17 = 0;
  }
  else
  {
LABEL_6:

    objc_autoreleasePoolPop(context);
    v16 = v32;
    +[_DPPiRapporEncoderResult encoderResultWithPhi0:otherPhi:](_DPPiRapporEncoderResult, "encoderResultWithPhi0:otherPhi:", v32, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)decode:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unsigned int *v10;
  unint64_t v11;
  uint64_t v12;
  int *v13;
  unsigned int *v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  void *v18;
  NSObject *v19;
  id v21;
  void *context;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;

  v4 = a3;
  v5 = objc_msgSend(v4, "numberOfEncodedIndices");
  objc_msgSend(v4, "phi0");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = objc_msgSend(v6, "bytes");

  objc_msgSend(v4, "otherPhi");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24 = objc_msgSend(v7, "bytes");

  v8 = objc_msgSend(v4, "numberOfOtherPhi");
  if (v8 == -[_DPPiRapporAlgorithm numberOfOtherPhi](self, "numberOfOtherPhi"))
  {
    v23 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_DPPiRapporAlgorithm numberOfClasses](self, "numberOfClasses"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)MEMORY[0x1D8256B78]();
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * v8);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (unsigned int *)objc_msgSend(v21, "bytes");
    if (-[_DPPiRapporAlgorithm numberOfClasses](self, "numberOfClasses"))
    {
      v11 = 0;
      v26 = v9;
      v27 = v5;
      do
      {
        v28 = v11;
        pi_rappor_get_coefficients(v10, v8, v11, -[_DPPiRapporAlgorithm prime](self, "prime"));
        v12 = 0;
        if (v5)
        {
          v14 = (unsigned int *)v24;
          v13 = (int *)v25;
          do
          {
            v15 = *v13++;
            v16 = dotprod_mod32(v10, v14, v8, -[_DPPiRapporAlgorithm prime](self, "prime"));
            v17 = addmod32(v16, v15, -[_DPPiRapporAlgorithm prime](self, "prime"));
            v12 += pi_rappor_BOOL_func(v17, -[_DPPiRapporAlgorithm threshold](self, "threshold"));
            v14 += v8;
            --v5;
          }
          while (v5);
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v26;
        objc_msgSend(v26, "setObject:atIndexedSubscript:", v18, v28);

        v11 = v28 + 1;
        v5 = v27;
      }
      while (v28 + 1 < -[_DPPiRapporAlgorithm numberOfClasses](self, "numberOfClasses"));
    }

    objc_autoreleasePoolPop(context);
    v4 = v23;
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[_DPPiRapporAlgorithm decode:].cold.1(self, v8, v19);

    v9 = 0;
  }

  return v9;
}

- (BOOL)encodeClassIndex:(unint64_t)a3 coeffs:(unsigned int *)a4 phi0Buf:(unsigned int *)a5 otherPhiBuf:(unsigned int *)a6
{
  unint64_t v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  NSObject *v19;
  unsigned int v21;
  unsigned int v22;

  if (-[_DPPiRapporAlgorithm numberOfOtherPhi](self, "numberOfOtherPhi"))
  {
    v11 = 0;
    do
      a6[v11++] = arc4random_uniform(-[_DPPiRapporAlgorithm prime](self, "prime"));
    while (v11 < -[_DPPiRapporAlgorithm numberOfOtherPhi](self, "numberOfOtherPhi"));
  }
  -[_DPPiRapporAlgorithm coin](self, "coin");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "flip");

  pi_rappor_get_coefficients(a4, -[_DPPiRapporAlgorithm numberOfOtherPhi](self, "numberOfOtherPhi"), a3, -[_DPPiRapporAlgorithm prime](self, "prime"));
  v14 = dotprod_mod32(a4, a6, -[_DPPiRapporAlgorithm numberOfOtherPhi](self, "numberOfOtherPhi"), -[_DPPiRapporAlgorithm prime](self, "prime"));
  v15 = submod32(0, v14, -[_DPPiRapporAlgorithm prime](self, "prime"));
  v22 = 0;
  v21 = -[_DPPiRapporAlgorithm prime](self, "prime");
  pi_rappor_inverse_BOOL_func(v13, -[_DPPiRapporAlgorithm threshold](self, "threshold"), -[_DPPiRapporAlgorithm prime](self, "prime"), &v22, &v21);
  v17 = v21;
  v16 = v22;
  if (v21 <= v22)
  {
    +[_DPLog framework](_DPLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[_DPPiRapporAlgorithm encodeClassIndex:coeffs:phi0Buf:otherPhiBuf:].cold.1((int *)&v22, (int *)&v21, v19);

  }
  else
  {
    v18 = arc4random_uniform(v21 - v22) + v16;
    *a5 = addmod32(v18, v15, -[_DPPiRapporAlgorithm prime](self, "prime"));
  }
  return v17 > v16;
}

- (unint64_t)numberOfClasses
{
  return self->_numberOfClasses;
}

- (unsigned)prime
{
  return self->_prime;
}

- (double)alpha0
{
  return self->_alpha0;
}

- (double)alpha1
{
  return self->_alpha1;
}

- (unint64_t)numberOfOtherPhi
{
  return self->_numberOfOtherPhi;
}

- (unsigned)threshold
{
  return self->_threshold;
}

- (_DPBiasedCoin)coin
{
  return self->_coin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coin, 0);
}

- (void)initWithNumberOfClasses:(uint64_t)a3 prime:(uint64_t)a4 alpha0:(uint64_t)a5 alpha1:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a1, a3, "Pi-Rappor algorithm's number of classes must be greater than 0, instead got %lu.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithNumberOfClasses:(int)a1 prime:(NSObject *)a2 alpha0:alpha1:.cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D3FAA000, a2, OS_LOG_TYPE_ERROR, "Pi-Rappor algorithm's prime number must be greater than 1, instead got %d.", (uint8_t *)v2, 8u);
}

- (void)initWithNumberOfClasses:(uint64_t)a3 prime:(uint64_t)a4 alpha0:(uint64_t)a5 alpha1:(uint64_t)a6 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a1, a3, "Pi-Rappor algorithm's alpha0 must be between 0.0 and 1.0, instead got %.6f.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithNumberOfClasses:(uint64_t)a3 prime:(uint64_t)a4 alpha0:(uint64_t)a5 alpha1:(uint64_t)a6 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a1, a3, "Pi-Rappor algorithm's alpha1 must be between 0.0 and 1.0, instead got %.6f.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithNumberOfClasses:(os_log_t)log prime:alpha0:alpha1:.cold.5(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_ERROR, "Pi-Rappor algorithm failed to initialize a biased coin.", v1, 2u);
}

- (void)initWithNumberOfClasses:(double)a3 prime:alpha0:alpha1:.cold.6(int a1, NSObject *a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a3;
  v5 = 1024;
  v6 = a1;
  _os_log_error_impl(&dword_1D3FAA000, a2, OS_LOG_TYPE_ERROR, "Bad combination of alpha0 (%.6f) and prime (%d) in Pi-Rappor algorithm, ceil(alpha0 * prime) should be > 0 and < prime.", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithNumberOfClasses:(double)a3 prime:(uint64_t)a4 alpha0:(uint64_t)a5 alpha1:.cold.7(NSObject *a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  int v5;
  double v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = a2;
  v7 = 2048;
  v8 = a3;
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a1, a5, "Pi-Rappor algorithm's alpha0 (%.6f) must be less than alpha1 (%.6f)", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1();
}

- (void)encodeClassIndices:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Pi-Rappor algorithm failed to encode class index %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)encodeClassIndices:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Class index %lu is out of bounds.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)decode:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 134218240;
  v7 = objc_msgSend(a1, "numberOfOtherPhi");
  v8 = 2048;
  v9 = a2;
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a3, v5, "The provided Pi-Rappor encoder result is likely not generated by this Pi-Rappor algorithm instance, expected numberOfOtherPhi: %lu, got numberOfOtherPhi: %lu", (uint8_t *)&v6);
}

- (void)encodeClassIndex:(os_log_t)log coeffs:phi0Buf:otherPhiBuf:.cold.1(int *a1, int *a2, os_log_t log)
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  _os_log_error_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_ERROR, "Pi-Rappor algorithm failed to sample phi0 within lower bound (%d) and upper bound (%d).", (uint8_t *)v5, 0xEu);
  OUTLINED_FUNCTION_1();
}

@end
