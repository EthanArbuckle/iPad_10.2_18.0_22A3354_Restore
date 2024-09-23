@implementation _OSLogDeserializedEventProxy

- (void)_resetNeedsLookup
{
  self->_needsTypeLookup = 1;
  self->_unixDateNeedsLookup = 1;
  self->_unixTimeZoneNeedsLookup = 1;
  self->_lossStartUnixDateNeedsLookup = 1;
  self->_lossStartUnixTimeZoneNeedsLookup = 1;
  self->_lossEndUnixDateNeedsLookup = 1;
  self->_lossEndUnixTimeZoneNeedsLookup = 1;
}

- (void)setCurEventDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_curEventDictionary, a3);
  -[_OSLogDeserializedEventProxy _resetNeedsLookup](self, "_resetNeedsLookup");
}

- (unint64_t)type
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  void *v9;
  uint64_t v10;

  if (!-[_OSLogDeserializedEventProxy needsTypeLookup](self, "needsTypeLookup"))
    return self->_type;
  self->_needsTypeLookup = 0;
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("t"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 917, CFSTR("Could not get type for proxy"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 918, CFSTR("Unexpected class: %@. Expected: %@"), v10, objc_opt_class());

  }
  v6 = objc_msgSend(v5, "unsignedLongLongValue");
  self->_type = v6;

  return v6;
}

- (unint64_t)logType
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 922, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)size
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("s"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 923, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)timeToLive
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ttl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 924, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)traceIdentifier
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ti"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 925, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)threadIdentifier
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 926, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)activityIdentifier
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 927, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)parentActivityIdentifier
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("paid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 928, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)transitionActivityIdentifier
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tai"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 929, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)continuousNanosecondsSinceBoot
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ns"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 930, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)machContinuousTimestamp
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mct"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 931, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)senderImageOffset
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sio"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 932, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)signpostIdentifier
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("si"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 933, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)signpostType
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1536)
    return 0;
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("st"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 936, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)signpostScope
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1536)
    return 0;
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ss"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 937, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)creatorActivityIdentifier
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  if (-[_OSLogDeserializedEventProxy type](self, "type") != 513)
    return 0;
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cai"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 940, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)creatorProcessUniqueIdentifier
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  if (-[_OSLogDeserializedEventProxy type](self, "type") != 513)
    return 0;
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpui"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 941, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)lossStartMachContinuousTimestamp
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1792)
    return 0;
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lsmct"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 944, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)lossEndMachContinuousTimestamp
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1792)
    return 0;
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lemct"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 945, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)processIdentifier
{
  void *v4;
  void *v5;
  int v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 948, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "longLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)composedMessage
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cm"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 951, CFSTR("Unexpected class: %@. Expected: %@"), v11, objc_opt_class());

  }
  -[_OSLogDeserializedEventProxy metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 951, CFSTR("Could not look up string for: %s"), "composedMessage");

LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (id)processImagePath
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pip"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 952, CFSTR("Unexpected class: %@. Expected: %@"), v11, objc_opt_class());

  }
  -[_OSLogDeserializedEventProxy metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 952, CFSTR("Could not look up string for: %s"), "processImagePath");

LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (id)process
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("p"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 953, CFSTR("Unexpected class: %@. Expected: %@"), v11, objc_opt_class());

  }
  -[_OSLogDeserializedEventProxy metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 953, CFSTR("Could not look up string for: %s"), "process");

LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (id)senderImagePath
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sip"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 954, CFSTR("Unexpected class: %@. Expected: %@"), v11, objc_opt_class());

  }
  -[_OSLogDeserializedEventProxy metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 954, CFSTR("Could not look up string for: %s"), "senderImagePath");

LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (id)sender
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("send"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 955, CFSTR("Unexpected class: %@. Expected: %@"), v11, objc_opt_class());

  }
  -[_OSLogDeserializedEventProxy metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 955, CFSTR("Could not look up string for: %s"), "sender");

LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (id)subsystem
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1536
    && -[_OSLogDeserializedEventProxy type](self, "type") != 1024)
  {
    v7 = 0;
    return v7;
  }
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sub"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_class();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 958, CFSTR("Unexpected class: %@. Expected: %@"), v11, objc_opt_class());

    }
    -[_OSLogDeserializedEventProxy metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringForIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 958, CFSTR("Could not look up string for: %s"), "subsystem");

  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (id)category
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1536
    && -[_OSLogDeserializedEventProxy type](self, "type") != 1024)
  {
    v7 = 0;
    return v7;
  }
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cat"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_class();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 959, CFSTR("Unexpected class: %@. Expected: %@"), v11, objc_opt_class());

    }
    -[_OSLogDeserializedEventProxy metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringForIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 959, CFSTR("Could not look up string for: %s"), "category");

  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (id)formatString
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1536
    && -[_OSLogDeserializedEventProxy type](self, "type") != 1024
    && -[_OSLogDeserializedEventProxy type](self, "type") != 768)
  {
    v7 = 0;
    return v7;
  }
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("f"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_class();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 960, CFSTR("Unexpected class: %@. Expected: %@"), v11, objc_opt_class());

    }
    -[_OSLogDeserializedEventProxy metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringForIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 960, CFSTR("Could not look up string for: %s"), "formatString");

  }
  v7 = 0;
LABEL_10:

  return v7;
}

- (id)signpostName
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1536)
  {
    v7 = 0;
    return v7;
  }
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sn"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_class();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 962, CFSTR("Unexpected class: %@. Expected: %@"), v11, objc_opt_class());

    }
    -[_OSLogDeserializedEventProxy metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringForIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 962, CFSTR("Could not look up string for: %s"), "signpostName");

  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (id)processImageUUID
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("piu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 965, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v5), "bytes"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (const)processImageUUIDBytes
{
  void *v4;
  void *v5;
  const char *v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("piu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 965, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)senderImageUUID
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 966, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v5), "bytes"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (const)senderImageUUIDBytes
{
  void *v4;
  void *v5;
  const char *v6;
  void *v8;
  uint64_t v9;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 966, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)bootUUID
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;
  uint64_t v12;

  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("b"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_class();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 971, CFSTR("Unexpected class: %@. Expected: %@"), v12, objc_opt_class());

    }
  }
  v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v7 = objc_retainAutorelease(v5);
  v8 = (void *)objc_msgSend(v6, "initWithUUIDBytes:", objc_msgSend(v7, "bytes"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 974, CFSTR("Encountered nil bootUUID"));

  }
  return v8;
}

- (void)_populate_timeval:(timeval *)a3 withDict:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sec"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("usec"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10
    || !v8
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1003, CFSTR("Malformed timeval dict"));

  }
  a3->tv_sec = objc_msgSend(v10, "longValue");
  a3->tv_usec = objc_msgSend(v8, "intValue");

}

- (void)_populate_timezone:(timezone *)a3 withDict:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mw"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10
    || !v8
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1015, CFSTR("Malformed timeval dict"));

  }
  a3->tz_minuteswest = objc_msgSend(v10, "intValue");
  a3->tz_dsttime = objc_msgSend(v8, "intValue");

}

- (timeval)unixDate
{
  void *v4;
  void *v5;
  timeval *p_unixDate;
  void *v8;
  void *v9;
  uint64_t v10;

  if (!self->_unixDateNeedsLookup)
    return &self->_unixDate;
  self->_unixDateNeedsLookup = 0;
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ud"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1021, CFSTR("Could not fetch nonnull property"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1021, CFSTR("Unexpected class: %@. Expected: %@"), v10, objc_opt_class());

  }
  p_unixDate = &self->_unixDate;
  -[_OSLogDeserializedEventProxy _populate_timeval:withDict:](self, "_populate_timeval:withDict:", &self->_unixDate, v5);

  return p_unixDate;
}

- (timezone)unixTimeZone
{
  void *v4;
  void *v5;
  timezone *p_unixTimeZone;
  void *v8;
  void *v9;
  uint64_t v10;

  if (!self->_unixTimeZoneNeedsLookup)
    return &self->_unixTimeZone;
  self->_unixTimeZoneNeedsLookup = 0;
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utz"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1021, CFSTR("Could not fetch nonnull property"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1021, CFSTR("Unexpected class: %@. Expected: %@"), v10, objc_opt_class());

  }
  p_unixTimeZone = &self->_unixTimeZone;
  -[_OSLogDeserializedEventProxy _populate_timezone:withDict:](self, "_populate_timezone:withDict:", &self->_unixTimeZone, v5);

  return p_unixTimeZone;
}

- (id)date
{
  timeval *v4;
  void *v6;

  v4 = -[_OSLogDeserializedEventProxy unixDate](self, "unixDate");
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1030, CFSTR("Could not get Unix date"));

  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v4->tv_usec / 1000000.0 + (double)v4->tv_sec);
}

- (id)timeZone
{
  timezone *v4;
  void *v6;

  v4 = -[_OSLogDeserializedEventProxy unixTimeZone](self, "unixTimeZone");
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1038, CFSTR("Could not get Unix timezone"));

  }
  return (id)objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 3600 * v4->tz_dsttime + -60 * v4->tz_minuteswest);
}

- (timeval)lossStartUnixDate
{
  void *v4;
  void *v5;
  timeval *p_lossStartUnixDate;
  void *v8;
  uint64_t v9;

  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1792)
    return 0;
  if (!self->_lossStartUnixDateNeedsLookup)
    return &self->_lossStartUnixDate;
  self->_lossStartUnixDateNeedsLookup = 0;
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lsud"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1048, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    p_lossStartUnixDate = &self->_lossStartUnixDate;
    -[_OSLogDeserializedEventProxy _populate_timeval:withDict:](self, "_populate_timeval:withDict:", &self->_lossStartUnixDate, v5);
  }
  else
  {
    p_lossStartUnixDate = 0;
  }

  return p_lossStartUnixDate;
}

- (timezone)lossStartUnixTimeZone
{
  void *v4;
  void *v5;
  timezone *p_lossStartUnixTimeZone;
  void *v8;
  uint64_t v9;

  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1792)
    return 0;
  if (!self->_lossStartUnixTimeZoneNeedsLookup)
    return &self->_lossStartUnixTimeZone;
  self->_lossStartUnixTimeZoneNeedsLookup = 0;
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lsutz"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1048, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    p_lossStartUnixTimeZone = &self->_lossStartUnixTimeZone;
    -[_OSLogDeserializedEventProxy _populate_timezone:withDict:](self, "_populate_timezone:withDict:", &self->_lossStartUnixTimeZone, v5);
  }
  else
  {
    p_lossStartUnixTimeZone = 0;
  }

  return p_lossStartUnixTimeZone;
}

- (timeval)lossEndUnixDate
{
  void *v4;
  void *v5;
  timeval *p_lossEndUnixDate;
  void *v8;
  uint64_t v9;

  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1792)
    return 0;
  if (!self->_lossEndUnixDateNeedsLookup)
    return &self->_lossEndUnixDate;
  self->_lossEndUnixDateNeedsLookup = 0;
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("leud"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1049, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    p_lossEndUnixDate = &self->_lossEndUnixDate;
    -[_OSLogDeserializedEventProxy _populate_timeval:withDict:](self, "_populate_timeval:withDict:", &self->_lossEndUnixDate, v5);
  }
  else
  {
    p_lossEndUnixDate = 0;
  }

  return p_lossEndUnixDate;
}

- (timezone)lossEndUnixTimeZone
{
  void *v4;
  void *v5;
  timezone *p_lossEndUnixTimeZone;
  void *v8;
  uint64_t v9;

  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1792)
    return 0;
  if (!self->_lossEndUnixTimeZoneNeedsLookup)
    return &self->_lossEndUnixTimeZone;
  self->_lossEndUnixTimeZoneNeedsLookup = 0;
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("leutz"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1049, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    p_lossEndUnixTimeZone = &self->_lossEndUnixTimeZone;
    -[_OSLogDeserializedEventProxy _populate_timezone:withDict:](self, "_populate_timezone:withDict:", &self->_lossEndUnixTimeZone, v5);
  }
  else
  {
    p_lossEndUnixTimeZone = 0;
  }

  return p_lossEndUnixTimeZone;
}

- ($8814E4F230000EB768D7E307C62B5F7C)lossCount
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  void *v12;

  if (-[_OSLogDeserializedEventProxy type](self, "type") == 1792)
  {
    -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lc"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1056, CFSTR("Unexpected type for loss count dict"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("c"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("s"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "unsignedLongLongValue");
    v9 = objc_msgSend(v7, "BOOLValue");

    if (v9)
      v10 = 0x100000000;
    else
      v10 = 0;
    return ($8814E4F230000EB768D7E307C62B5F7C)(v10 & 0xFFFFFFFF00000000 | v8);
  }
  else
  {
    return ($8814E4F230000EB768D7E307C62B5F7C)0;
  }
}

- (id)_frameForDict:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  OSLogEventBacktraceFrame *v8;
  id v9;
  OSLogEventBacktraceFrame *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iu"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_class();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1068, CFSTR("Unexpected class: %@. Expected: %@"), v13, objc_opt_class());

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("io"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1072, CFSTR("Unexpected class: %@. Expected: %@"), v15, objc_opt_class());

    if (v6)
      goto LABEL_7;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1074, CFSTR("Malformed frame dictionary"));

    goto LABEL_7;
  }
  if (!v6)
    goto LABEL_9;
LABEL_7:
  v8 = [OSLogEventBacktraceFrame alloc];
  v9 = objc_retainAutorelease(v6);
  v10 = -[OSLogEventBacktraceFrame initWithUUIDBytes:andOffset:](v8, "initWithUUIDBytes:andOffset:", objc_msgSend(v9, "bytes"), objc_msgSend(v7, "unsignedLongLongValue"));

  return v10;
}

- (id)backtrace
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  OSLogEventBacktraceFrame *v16;
  OSLogEventBacktrace *v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  SEL v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_class();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1083, CFSTR("Unexpected class: %@. Expected: %@"), v20, objc_opt_class());

    }
    v22 = a2;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_opt_class();
            objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v22, self, CFSTR("EventSerializer.m"), 1085, CFSTR("Unexpected class: %@. Expected: %@"), v21, objc_opt_class());

          }
          -[_OSLogDeserializedEventProxy _frameForDict:](self, "_frameForDict:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

  }
  else
  {
    v15 = -[_OSLogDeserializedEventProxy senderImageUUIDBytes](self, "senderImageUUIDBytes");
    if (v15)
    {
      v16 = -[OSLogEventBacktraceFrame initWithUUIDBytes:andOffset:]([OSLogEventBacktraceFrame alloc], "initWithUUIDBytes:andOffset:", v15, -[_OSLogDeserializedEventProxy senderImageOffset](self, "senderImageOffset"));
      objc_msgSend(v6, "addObject:", v16);

    }
  }
  if (objc_msgSend(v6, "count"))
    v17 = -[OSLogEventBacktrace initWithFrames:]([OSLogEventBacktrace alloc], "initWithFrames:", v6);
  else
    v17 = 0;

  return v17;
}

- (id)decomposedMessage
{
  void *v4;
  void *v5;
  OSLogDeserializedEventDecomposedMessage *v6;
  void *v7;
  OSLogDeserializedEventDecomposedMessage *v8;
  void *v10;
  uint64_t v11;

  if (-[_OSLogDeserializedEventProxy type](self, "type") == 1536
    || -[_OSLogDeserializedEventProxy type](self, "type") == 1024
    || -[_OSLogDeserializedEventProxy type](self, "type") == 768)
  {
    -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dm"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_class();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1110, CFSTR("Unexpected class: %@. Expected: %@"), v11, objc_opt_class());

      }
      v6 = [OSLogDeserializedEventDecomposedMessage alloc];
      -[_OSLogDeserializedEventProxy metadata](self, "metadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[OSLogDeserializedEventDecomposedMessage initWithDict:metadata:](v6, "initWithDict:metadata:", v5, v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSDictionary)curEventDictionary
{
  return self->_curEventDictionary;
}

- (_OSLogEventSerializationMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (BOOL)needsTypeLookup
{
  return self->_needsTypeLookup;
}

- (void)setNeedsTypeLookup:(BOOL)a3
{
  self->_needsTypeLookup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_curEventDictionary, 0);
}

@end
