@implementation SHAudioConverter

- (id)supportedPCMBufferFromBuffer:(id)a3 error:(id *)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "channelCount");

  if (v9 >= 2)
    v10 = 2;
  else
    v10 = v9;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithCommonFormat:sampleRate:channels:interleaved:", 1, v10, 1, 48000.0);
  if (objc_msgSend(v7, "frameLength"))
  {
    v12 = (double)objc_msgSend(v7, "frameLength");
    objc_msgSend(v7, "format");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sampleRate");
    LODWORD(v4) = vcvtad_u64_f64(48000.0 / v14 * v12);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1838]), "initWithPCMFormat:frameCapacity:", v11, v4);
    objc_msgSend(v7, "format");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHAudioConverter audioConverterWithInputFormat:outputFormat:](self, "audioConverterWithInputFormat:outputFormat:", v16, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "format");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Failed to convert input buffer with format %@ to standard format %@"), objc_msgSend(v19, "formatDescription"), objc_msgSend(v11, "formatDescription"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      v21 = v17 == 0;
    else
      v21 = 1;
    if (v21)
    {
      v33 = *MEMORY[0x24BDD0FC8];
      v34[0] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[SHError annotateClientError:code:underlyingError:keyOverrides:](SHError, "annotateClientError:code:underlyingError:keyOverrides:", a4, 100, 0, v22);
      v23 = 0;
    }
    else
    {
      v30 = 0;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __55__SHAudioConverter_supportedPCMBufferFromBuffer_error___block_invoke;
      v28[3] = &unk_24D9B7D80;
      v29 = v7;
      v24 = objc_msgSend(v17, "convertToBuffer:error:withInputFromBlock:", v15, &v30, v28);
      v25 = v30;
      v22 = v25;
      if (v24 == 3)
      {
        v31 = *MEMORY[0x24BDD0FC8];
        v32 = v20;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[SHError annotateClientError:code:underlyingError:keyOverrides:](SHError, "annotateClientError:code:underlyingError:keyOverrides:", a4, 100, v22, v26);

        v23 = 0;
      }
      else
      {
        v23 = v15;
      }

    }
  }
  else
  {
    v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB1838]), "initWithPCMFormat:frameCapacity:", v11, 0);
  }

  return v23;
}

id __55__SHAudioConverter_supportedPCMBufferFromBuffer_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  *a3 = 0;
  return *(id *)(a1 + 32);
}

- (SHAudioConverter)audioConverterWithInputFormat:(id)a3 outputFormat:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[SHAudioConverter converter](self, "converter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v9) & 1) != 0)
  {
    -[SHAudioConverter converter](self, "converter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "outputFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "isEqual:", v11);

    if ((v12 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB17F8]), "initFromFormat:toFormat:", v6, v7);
  -[SHAudioConverter setConverter:](self, "setConverter:", v13);

LABEL_6:
  -[SHAudioConverter converter](self, "converter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (SHAudioConverter *)v14;
}

- (AVAudioConverter)converter
{
  return self->_converter;
}

- (void)setConverter:(id)a3
{
  objc_storeStrong((id *)&self->_converter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_converter, 0);
}

@end
