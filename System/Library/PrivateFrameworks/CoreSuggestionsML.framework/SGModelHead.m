@implementation SGModelHead

- (SGModelHead)initWithDictionary:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  SGModelHead *v10;
  NSArray *v11;
  NSArray *labels;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  SGModelHead *v18;
  NSArray *v19;
  void *v20;
  void *v21;
  NSObject *v23;
  const char *v24;
  objc_super v25;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v23 = MEMORY[0x24BDACB70];
      v24 = "dictionary";
      goto LABEL_25;
    }
    goto LABEL_9;
  }

  v25.receiver = self;
  v25.super_class = (Class)SGModelHead;
  v10 = -[SGModelHead init](&v25, sel_init);
  self = v10;
  if (!v10)
  {
LABEL_16:
    self = self;
    v18 = self;
    goto LABEL_17;
  }
  objc_storeStrong((id *)&v10->_name, a4);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LABELS"));
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  labels = self->_labels;
  self->_labels = v11;

  if (!self->_labels)
  {
    v19 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NUMBER_OF_DIMENSIONS"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v19 = self->_labels;
LABEL_12:
    v17 = -[NSArray count](v19, "count");
    if (v17)
      goto LABEL_13;
    objc_msgSend(v9, "numberAssertedForKey:", CFSTR("NUMBER_OF_DIMENSIONS"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = v20;
      self->_numberOfDimensions = objc_msgSend(v20, "unsignedIntegerValue");

      goto LABEL_16;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v23 = MEMORY[0x24BDACB70];
      v24 = "[dictionary numberAssertedForKey:@\"NUMBER_OF_DIMENSIONS\"]";
      goto LABEL_25;
    }
    goto LABEL_9;
  }
  objc_msgSend(v9, "numberAssertedForKey:", CFSTR("NUMBER_OF_DIMENSIONS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = v14;
    v16 = objc_msgSend(v14, "unsignedIntegerValue");

    if (-[NSArray count](self->_labels, "count") == v16)
    {
      v17 = -[NSArray count](self->_labels, "count");
LABEL_13:
      self->_numberOfDimensions = v17;
      goto LABEL_16;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v23 = MEMORY[0x24BDACB70];
      v24 = "_labels.count == numberOfDimensions";
      goto LABEL_25;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    v23 = MEMORY[0x24BDACB70];
    v24 = "[dictionary numberAssertedForKey:@\"NUMBER_OF_DIMENSIONS\"]";
LABEL_25:
    _os_log_fault_impl(&dword_21ABF4000, v23, OS_LOG_TYPE_FAULT, v24, buf, 2u);
  }
LABEL_9:
  v18 = 0;
LABEL_17:

  return v18;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)numberOfDimensions
{
  return self->_numberOfDimensions;
}

- (NSArray)labels
{
  return self->_labels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
