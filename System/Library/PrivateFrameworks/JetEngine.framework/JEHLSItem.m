@implementation JEHLSItem

- (JEHLSItem)initWithStartOverallPosition:(unint64_t)a3 metricsData:(id)a4
{
  id v6;
  JEHLSItem *v7;
  JEHLSItem *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)JEHLSItem;
  v7 = -[JEHLSItem init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[JEHLSItem setStartOverallPosition:](v7, "setStartOverallPosition:", a3);
    -[JEHLSItem setEventData:](v8, "setEventData:", v6);
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[JEHLSItem startOverallPosition](self, "startOverallPosition");
  if (v5 == objc_msgSend(v4, "startOverallPosition"))
  {
    v6 = 0;
  }
  else
  {
    v7 = -[JEHLSItem startOverallPosition](self, "startOverallPosition");
    if (v7 < objc_msgSend(v4, "startOverallPosition"))
      v6 = -1;
    else
      v6 = 1;
  }

  return v6;
}

+ (id)comparator
{
  return &__block_literal_global_0;
}

uint64_t __23__JEHLSItem_comparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "startOverallPosition");
  if (v6 == objc_msgSend(v5, "startOverallPosition"))
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "startOverallPosition");
    if (v8 < objc_msgSend(v5, "startOverallPosition"))
      v7 = -1;
    else
      v7 = 1;
  }

  return v7;
}

- (unint64_t)startOverallPosition
{
  return self->_startOverallPosition;
}

- (void)setStartOverallPosition:(unint64_t)a3
{
  self->_startOverallPosition = a3;
}

- (unint64_t)startPosition
{
  return self->_startPosition;
}

- (void)setStartPosition:(unint64_t)a3
{
  self->_startPosition = a3;
}

- (NSArray)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
  objc_storeStrong((id *)&self->_eventData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);
}

@end
