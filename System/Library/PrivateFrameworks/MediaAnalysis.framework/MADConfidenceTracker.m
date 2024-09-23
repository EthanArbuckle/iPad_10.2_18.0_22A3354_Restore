@implementation MADConfidenceTracker

- (MADConfidenceTracker)init
{
  MADConfidenceTracker *v2;
  uint64_t v3;
  NSMutableArray *history;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MADConfidenceTracker;
  v2 = -[MADConfidenceTracker init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    history = v2->_history;
    v2->_history = (NSMutableArray *)v3;

    v2->_confidence = 0.0;
  }
  return v2;
}

- (double)updateConfidence:(double)a3
{
  unint64_t v5;
  NSMutableArray *history;
  void *v7;
  unint64_t v8;
  NSMutableArray *v9;
  void *v10;
  double v11;
  uint64_t v12;
  double result;

  v5 = +[MADVideoRemoveBackgroundSettings visionTrimWindow](MADVideoRemoveBackgroundSettings, "visionTrimWindow");
  history = self->_history;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](history, "addObject:", v7);

  self->_confidence = self->_confidence + a3;
  v8 = -[NSMutableArray count](self->_history, "count");
  v9 = self->_history;
  if (v8 <= v5)
  {
    v12 = -[NSMutableArray count](v9, "count");
    result = 1.0;
    if (v12 != v5)
      return result;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    self->_confidence = self->_confidence - v11;

    -[NSMutableArray removeObjectAtIndex:](self->_history, "removeObjectAtIndex:", 0);
  }
  return self->_confidence / (double)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
}

@end
