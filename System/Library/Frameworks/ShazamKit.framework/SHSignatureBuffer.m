@implementation SHSignatureBuffer

- (SHSignatureBuffer)initWithMinimumSignatureDuration:(double)a3 maximumSignatureDuration:(double)a4 bufferDuration:(double)a5
{
  SHSignatureBuffer *v8;
  SHSignatureBuffer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SHSignatureBuffer;
  v8 = -[SHSignatureBuffer init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_minimumSignatureDuration = a3;
    v8->_maximumSignatureDuration = a4;
    v8->_bufferMaxSize = a5;
    -[SHSignatureBuffer reset](v8, "reset");
  }
  return v9;
}

- (SHSignatureBuffer)initWithMinimumSignatureDuration:(double)a3 maximumSignatureDuration:(double)a4 bufferDuration:(double)a5 signatureGenerator:(id)a6
{
  id v11;
  SHSignatureBuffer *v12;
  SHSignatureBuffer *v13;

  v11 = a6;
  v12 = -[SHSignatureBuffer initWithMinimumSignatureDuration:maximumSignatureDuration:bufferDuration:](self, "initWithMinimumSignatureDuration:maximumSignatureDuration:bufferDuration:", a3, a4, a5);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_signatureGenerator, a6);
    -[SHSignatureGenerator updateRingBufferDuration:error:](v13->_signatureGenerator, "updateRingBufferDuration:error:", 0, a5);
  }

  return v13;
}

- (void)discardSignatureWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  double v24;
  id v25;
  id v26;
  uint8_t buf[4];
  double v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SHSignatureBuffer currentSignature](self, "currentSignature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    -[SHSignatureBuffer signatureGenerator](self, "signatureGenerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "duration");
    v10 = v9;
    -[SHSignatureBuffer currentSignature](self, "currentSignature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "duration");
    v13 = v12;
    -[SHSignatureBuffer signatureOffset](self, "signatureOffset");
    v15 = v10 - (v13 + v14);

    -[SHSignatureBuffer signatureGenerator](self, "signatureGenerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v17 = objc_msgSend(v16, "updateRingBufferDuration:error:", &v26, v15);
    v18 = v26;

    if ((v17 & 1) != 0)
    {
      -[SHSignatureBuffer signatureGenerator](self, "signatureGenerator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSignatureBuffer bufferMaxSize](self, "bufferMaxSize");
      v25 = v18;
      v20 = objc_msgSend(v19, "updateRingBufferDuration:error:", &v25);
      v21 = v25;

      if ((v20 & 1) != 0)
      {
        -[SHSignatureBuffer setCurrentSignature:](self, "setCurrentSignature:", 0);
        -[SHSignatureBuffer setSignatureOffset:](self, "setSignatureOffset:", 0.0);
      }
      else
      {
        sh_log_object();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          -[SHSignatureBuffer bufferMaxSize](self, "bufferMaxSize");
          *(_DWORD *)buf = 134218242;
          v28 = v24;
          v29 = 2112;
          v30 = v21;
          _os_log_impl(&dword_218BF1000, v23, OS_LOG_TYPE_ERROR, "Failed to update ring buffer duration to %f, resetting %@", buf, 0x16u);
        }

        -[SHSignatureBuffer reset](self, "reset");
      }
      v18 = v21;
    }
    else
    {
      sh_log_object();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v28 = v15;
        v29 = 2112;
        v30 = v18;
        _os_log_impl(&dword_218BF1000, v22, OS_LOG_TYPE_ERROR, "Failed to update ring buffer duration to %f, resetting %@", buf, 0x16u);
      }

      -[SHSignatureBuffer reset](self, "reset");
    }

  }
}

- (void)reset
{
  SHSignatureGenerator *v3;
  SHSignatureGenerator *v4;
  SHSignatureGenerator *signatureGenerator;

  v3 = [SHSignatureGenerator alloc];
  -[SHSignatureBuffer bufferMaxSize](self, "bufferMaxSize");
  v4 = -[SHSignatureGenerator initSignatureRingBufferWithDuration:](v3, "initSignatureRingBufferWithDuration:");
  signatureGenerator = self->_signatureGenerator;
  self->_signatureGenerator = v4;

  -[SHSignatureBuffer setCurrentSignature:](self, "setCurrentSignature:", 0);
  -[SHSignatureBuffer setSignatureOffset:](self, "setSignatureOffset:", 0.0);
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[SHSignatureBuffer signatureGenerator](self, "signatureGenerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (double)currentSignatureDuration
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double result;

  -[SHSignatureBuffer signatureGenerator](self, "signatureGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duration");
  v5 = v4;
  -[SHSignatureBuffer signatureOffset](self, "signatureOffset");
  v7 = v5 - v6;

  -[SHSignatureBuffer maximumSignatureDuration](self, "maximumSignatureDuration");
  if (v7 < result)
    return v7;
  return result;
}

- (void)flow:(id)a3 time:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSignatureBuffer setFormat:](self, "setFormat:", v8);

  -[SHSignatureBuffer signatureGenerator](self, "signatureGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v10 = objc_msgSend(v9, "appendBuffer:atTime:error:", v6, v7, &v16);
  v11 = v16;

  if ((v10 & 1) == 0)
  {
    sh_log_object();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl(&dword_218BF1000, v12, OS_LOG_TYPE_ERROR, "Failed to append to signature buffer, resetting %@", buf, 0xCu);
    }

    -[SHSignatureBuffer reset](self, "reset");
    -[SHSignatureBuffer signatureGenerator](self, "signatureGenerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    objc_msgSend(v13, "appendBuffer:atTime:error:", v6, v7, &v15);
    v14 = v15;

    v11 = v14;
  }

}

- (id)generateCurrentSignature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SHSignature *v8;
  void *v9;
  void *v10;
  SHSignature *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  unsigned int v32;
  id v33;
  void *v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  SHSignature *v39;
  void *v40;
  void *v41;
  id v43;
  id v44;
  id v45;

  -[SHSignatureBuffer signatureGenerator](self, "signatureGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSignatureBuffer currentSignature](self, "currentSignature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SHSignatureBuffer currentSignature](self, "currentSignature");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v8 = [SHSignature alloc];
  objc_msgSend(v4, "dataRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "time");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v11 = -[SHSignature initWithID:dataRepresentation:startTime:error:](v8, "initWithID:dataRepresentation:startTime:error:", v7, v9, v10, &v45);
  v12 = v45;
  -[SHSignatureBuffer setCurrentSignature:](self, "setCurrentSignature:", v11);

  -[SHSignatureBuffer currentSignature](self, "currentSignature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SHSignatureBuffer currentSignature](self, "currentSignature");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "duration");
    v16 = v15;
    -[SHSignatureBuffer maximumSignatureDuration](self, "maximumSignatureDuration");
    if (v16 <= v17)
    {
      -[SHSignatureBuffer signatureOffset](self, "signatureOffset");
      v20 = v19;

      if (v20 <= 0.0)
      {
LABEL_12:
        -[SHSignatureBuffer currentSignature](self, "currentSignature");
        v18 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {

    }
    -[SHSignatureBuffer currentSignature](self, "currentSignature");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dataRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSignatureBuffer signatureOffset](self, "signatureOffset");
    v24 = v23;
    -[SHSignatureBuffer maximumSignatureDuration](self, "maximumSignatureDuration");
    v44 = v12;
    +[SigCrop cropSignature:atPosition:withDuration:error:](SigCrop, "cropSignature:atPosition:withDuration:error:", v22, &v44, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v44;

    if (!v26)
    {
      -[SHSignatureBuffer reset](self, "reset");
      v41 = (void *)objc_opt_new();
      v12 = v27;
      goto LABEL_14;
    }
    -[SHSignatureBuffer signatureOffset](self, "signatureOffset");
    v29 = v28;
    -[SHSignatureBuffer format](self, "format");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sampleRate");
    v32 = (v29 * v31);

    v33 = objc_alloc(MEMORY[0x24BDB1880]);
    objc_msgSend(v4, "time");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sampleRate");
    v36 = (uint64_t)(v35 + (double)v32);
    -[SHSignatureBuffer format](self, "format");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "sampleRate");
    v38 = (void *)objc_msgSend(v33, "initWithSampleTime:atRate:", v36);

    v43 = v27;
    v39 = -[SHSignature initWithID:dataRepresentation:startTime:error:]([SHSignature alloc], "initWithID:dataRepresentation:startTime:error:", v7, v26, v38, &v43);
    v12 = v43;

    -[SHSignatureBuffer setCurrentSignature:](self, "setCurrentSignature:", v39);
    -[SHSignatureBuffer currentSignature](self, "currentSignature");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v40)
    {
      -[SHSignatureBuffer reset](self, "reset");
      v41 = (void *)objc_opt_new();

      goto LABEL_14;
    }

    goto LABEL_12;
  }
  -[SHSignatureBuffer reset](self, "reset");
  v18 = objc_opt_new();
LABEL_13:
  v41 = (void *)v18;
LABEL_14:

  return v41;
}

- (BOOL)shouldGenerateSpectralOutput
{
  return self->_shouldGenerateSpectralOutput;
}

- (void)setShouldGenerateSpectralOutput:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_shouldGenerateSpectralOutput = a3;
  -[SHSignatureBuffer signatureGenerator](self, "signatureGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "enableSpectralOutput");
  else
    objc_msgSend(v4, "disableSpectralOutput");

}

- (double)signatureOffset
{
  return self->_signatureOffset;
}

- (void)setSignatureOffset:(double)a3
{
  self->_signatureOffset = a3;
}

- (double)minimumSignatureDuration
{
  return self->_minimumSignatureDuration;
}

- (void)setMinimumSignatureDuration:(double)a3
{
  self->_minimumSignatureDuration = a3;
}

- (double)maximumSignatureDuration
{
  return self->_maximumSignatureDuration;
}

- (void)setMaximumSignatureDuration:(double)a3
{
  self->_maximumSignatureDuration = a3;
}

- (double)bufferMaxSize
{
  return self->_bufferMaxSize;
}

- (void)setBufferMaxSize:(double)a3
{
  self->_bufferMaxSize = a3;
}

- (SHSignatureGenerator)signatureGenerator
{
  return self->_signatureGenerator;
}

- (void)setSignatureGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_signatureGenerator, a3);
}

- (SHSignature)currentSignature
{
  return self->_currentSignature;
}

- (void)setCurrentSignature:(id)a3
{
  objc_storeStrong((id *)&self->_currentSignature, a3);
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_currentSignature, 0);
  objc_storeStrong((id *)&self->_signatureGenerator, 0);
}

@end
