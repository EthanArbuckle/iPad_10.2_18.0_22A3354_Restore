@implementation VNWarningRecorder

- (VNWarningRecorder)init
{
  VNWarningRecorder *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *warnings;
  VNWarningRecorder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNWarningRecorder;
  v2 = -[VNWarningRecorder init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    warnings = v2->_warnings;
    v2->_warnings = v3;

    v5 = v2;
  }

  return v2;
}

- (void)recordWarning:(id)a3 value:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VNRequestWarningImageTooSmallForFaceObservations")) & 1) != 0
    || objc_msgSend(v15, "isEqualToString:", CFSTR("VNRequestWarningBlinkDetectionFailure")))
  {
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Wrong type for warning value - %@, should be %@"), objc_opt_class(), v7);
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", objc_opt_isKindOfClass() & 1, v8);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_warnings, "objectForKeyedSubscript:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v9);
      objc_msgSend(v10, "addObjectsFromArray:", v6);
      objc_msgSend(v10, "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "copy");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_warnings, "setObject:forKeyedSubscript:", v12, v15);

    }
    else
    {
      v10 = (void *)objc_msgSend(v6, "copy");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_warnings, "setObject:forKeyedSubscript:", v10, v15);
    }

    if (objc_msgSend(v15, "isEqualToString:", CFSTR("VNRequestWarningImageTooSmallForFaceObservations")))
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_warnings, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNRequestWarningImageTooSmall"));
  }
  else
  {
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VNRequestWarningImageMinimumLongDimension")) & 1) == 0
      && !objc_msgSend(v15, "isEqualToString:", CFSTR("VNRequestWarningImageMinimumShortDimension")))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_warnings, "setObject:forKeyedSubscript:", v6, v15);
      goto LABEL_14;
    }
    v13 = objc_opt_class();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Wrong type for warning value - %@, should be %@"), objc_opt_class(), v13);
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", objc_opt_isKindOfClass() & 1, v8);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_warnings, "objectForKeyedSubscript:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    if (!v14 || objc_msgSend(v14, "compare:", v6) == -1)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_warnings, "setObject:forKeyedSubscript:", v6, v15);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_warnings, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNRequestWarningImageTooSmall"));
    }
  }

LABEL_14:
}

- (id)valueForWarning:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_warnings, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)warnings
{
  return (id)-[NSMutableDictionary copy](self->_warnings, "copy");
}

- (BOOL)hasWarnings
{
  return -[NSMutableDictionary count](self->_warnings, "count") != 0;
}

- (void)setWarnings:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableDictionary removeAllObjects](self->_warnings, "removeAllObjects");
  if (v4)
    -[NSMutableDictionary addEntriesFromDictionary:](self->_warnings, "addEntriesFromDictionary:", v4);

}

- (void)recordWarnings:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__VNWarningRecorder_recordWarnings___block_invoke;
  v3[3] = &unk_1E45489E0;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warnings, 0);
}

uint64_t __36__VNWarningRecorder_recordWarnings___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "recordWarning:value:", a2, a3);
}

@end
