@implementation BKHIDEventSequenceRecognizer

+ (id)recognizerForEventDescriptor:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

+ (id)recognizerForEventDescriptors:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 shouldConsume:(BOOL *)a4
{
  void *v7;
  unint64_t descriptorIndex;

  -[NSArray objectAtIndexedSubscript:](self->_descriptors, "objectAtIndexedSubscript:", self->_descriptorIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v7, "matchesHIDEvent:", a3);

  descriptorIndex = self->_descriptorIndex;
  if ((_DWORD)a3)
  {
    self->_descriptorIndex = ++descriptorIndex;
    if (self->_shouldConsumeEvents)
      *a4 = 1;
  }
  if (descriptorIndex < -[NSArray count](self->_descriptors, "count"))
    return 0;
  self->_descriptorIndex = 0;
  return 1;
}

- (BOOL)shouldConsumeEvents
{
  return self->_shouldConsumeEvents;
}

- (void)setShouldConsumeEvents:(BOOL)a3
{
  self->_shouldConsumeEvents = a3;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptors, 0);
}

@end
