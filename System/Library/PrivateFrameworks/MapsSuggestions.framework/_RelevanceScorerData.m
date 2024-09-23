@implementation _RelevanceScorerData

- (_RelevanceScorerData)initWithNames:(id)a3 addresses:(id)a4 mapItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  _RelevanceScorerData *v11;
  _RelevanceScorerData *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_RelevanceScorerData;
  v11 = -[_RelevanceScorerData init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[_RelevanceScorerData setNames:](v11, "setNames:", v8);
    -[_RelevanceScorerData setAddresses:](v12, "setAddresses:", v9);
    -[_RelevanceScorerData setMapItems:](v12, "setMapItems:", v10);
  }

  return v12;
}

- (NSMutableArray)finalRelevanceScores
{
  return self->_finalRelevanceScores;
}

- (void)setFinalRelevanceScores:(id)a3
{
  objc_storeStrong((id *)&self->_finalRelevanceScores, a3);
}

- (NSMutableArray)indexMapping
{
  return self->_indexMapping;
}

- (void)setIndexMapping:(id)a3
{
  objc_storeStrong((id *)&self->_indexMapping, a3);
}

- (unint64_t)inputCount
{
  return self->_inputCount;
}

- (void)setInputCount:(unint64_t)a3
{
  self->_inputCount = a3;
}

- (NSMutableArray)names
{
  return self->_names;
}

- (void)setNames:(id)a3
{
  objc_storeStrong((id *)&self->_names, a3);
}

- (NSMutableArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_addresses, a3);
}

- (NSMutableArray)mapItems
{
  return self->_mapItems;
}

- (void)setMapItems:(id)a3
{
  objc_storeStrong((id *)&self->_mapItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItems, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_indexMapping, 0);
  objc_storeStrong((id *)&self->_finalRelevanceScores, 0);
}

@end
