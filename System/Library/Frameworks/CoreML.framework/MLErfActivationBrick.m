@implementation MLErfActivationBrick

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sequence");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "batch");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "channels");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "height");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self->_size = (int)(v8 * v6 * v10 * v12 * objc_msgSend(v13, "width"));

  return v4;
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4
{
  void *v6;
  float *v7;
  void *v8;
  float *v9;
  unint64_t i;
  float v11;
  id v12;

  v12 = a4;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (float *)objc_msgSend(v6, "rawPointer");

  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (float *)objc_msgSend(v8, "rawPointer");

  for (i = self->_size; i; --i)
  {
    v11 = *v7++;
    *v9++ = erff(v11);
  }

}

- (unint64_t)size
{
  return self->_size;
}

@end
