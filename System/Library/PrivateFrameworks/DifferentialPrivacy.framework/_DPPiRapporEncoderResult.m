@implementation _DPPiRapporEncoderResult

- (_DPPiRapporEncoderResult)init
{

  return 0;
}

- (_DPPiRapporEncoderResult)initWithPhi0:(id)a3 otherPhi:(id)a4
{
  id v7;
  id v8;
  _DPPiRapporEncoderResult *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DPPiRapporEncoderResult *v18;
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
  uint64_t v31;
  uint64_t v32;
  objc_super v34;

  v7 = a3;
  v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)_DPPiRapporEncoderResult;
  v9 = -[_DPPiRapporEncoderResult init](&v34, sel_init);
  if (!v9)
    goto LABEL_17;
  if (!v7 || !objc_msgSend(v7, "length"))
    goto LABEL_8;
  if ((objc_msgSend(v7, "length") & 3) == 0)
  {
    objc_storeStrong((id *)&v9->_phi0, a3);
    v9->_numberOfEncodedIndices = (unint64_t)objc_msgSend(v7, "length") >> 2;
    if (!v8)
      goto LABEL_8;
    if ((objc_msgSend(v8, "length") & 3) != 0)
    {
      +[_DPLog framework](_DPLog, "framework");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_DPPiRapporEncoderResult initWithPhi0:otherPhi:].cold.2(v10, v19, v20, v21, v22, v23, v24, v25);
      goto LABEL_7;
    }
    if (((unint64_t)objc_msgSend(v8, "length") >> 2) % v9->_numberOfEncodedIndices)
    {
      +[_DPLog framework](_DPLog, "framework");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_DPPiRapporEncoderResult initWithPhi0:otherPhi:].cold.1(v10, v26, v27, v28, v29, v30, v31, v32);
      goto LABEL_7;
    }
    objc_storeStrong((id *)&v9->_otherPhi, a4);
    v9->_numberOfOtherPhi = ((unint64_t)objc_msgSend(v8, "length") >> 2) / v9->_numberOfEncodedIndices;
LABEL_17:
    v18 = v9;
    goto LABEL_18;
  }
  +[_DPLog framework](_DPLog, "framework");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[_DPPiRapporEncoderResult initWithPhi0:otherPhi:].cold.3(v10, v11, v12, v13, v14, v15, v16, v17);
LABEL_7:

LABEL_8:
  v18 = 0;
LABEL_18:

  return v18;
}

+ (id)encoderResultWithPhi0:(id)a3 otherPhi:(id)a4
{
  id v5;
  id v6;
  _DPPiRapporEncoderResult *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_DPPiRapporEncoderResult initWithPhi0:otherPhi:]([_DPPiRapporEncoderResult alloc], "initWithPhi0:otherPhi:", v6, v5);

  return v7;
}

- (NSData)phi0
{
  return self->_phi0;
}

- (NSData)otherPhi
{
  return self->_otherPhi;
}

- (unint64_t)numberOfOtherPhi
{
  return self->_numberOfOtherPhi;
}

- (unint64_t)numberOfEncodedIndices
{
  return self->_numberOfEncodedIndices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherPhi, 0);
  objc_storeStrong((id *)&self->_phi0, 0);
}

- (void)initWithPhi0:(uint64_t)a3 otherPhi:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, a1, a3, "Malformed otherPhi in Pi-Rappor encoder result, the number of integers in otherPhi must be an integer multiple of number of encoded indices.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithPhi0:(uint64_t)a3 otherPhi:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, a1, a3, "Malformed otherPhi in Pi-Rappor encoder result, the size must be an integer multiple of the size of an unsigned integer.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithPhi0:(uint64_t)a3 otherPhi:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, a1, a3, "Malformed phi0 in Pi-Rappor encoder result, the size must be an integer multiple of the size of an unsigned integer.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
