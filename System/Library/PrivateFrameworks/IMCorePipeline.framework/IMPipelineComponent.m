@implementation IMPipelineComponent

- (id)bindTo:(id)a3
{
  objc_storeStrong((id *)&self->_nextComponent, a3);
  return self;
}

- (id)runIndividuallyWithInput:(id)a3
{
  return 0;
}

- (id)runWithInput:(id)a3
{
  IMPipelineComponent *nextComponent;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];

  nextComponent = self->_nextComponent;
  -[IMPipelineComponent runIndividuallyWithInput:](self, "runIndividuallyWithInput:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (nextComponent)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_21AD47688;
    v9[3] = &unk_24DDFFE88;
    v9[4] = self;
    objc_msgSend(v5, "then:", v9);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

+ (id)pipelineFromComponents:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") != 1)
    {
      v4 = 0;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectAtIndexedSubscript:", ++v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (id)objc_msgSend(v5, "bindTo:", v6);

      }
      while (objc_msgSend(v3, "count") - 1 > v4);
    }
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (IMPipelineComponent)nextComponent
{
  return self->_nextComponent;
}

- (void)setNextComponent:(id)a3
{
  objc_storeStrong((id *)&self->_nextComponent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextComponent, 0);
}

@end
