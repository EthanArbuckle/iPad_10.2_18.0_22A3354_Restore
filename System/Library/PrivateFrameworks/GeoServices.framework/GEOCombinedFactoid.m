@implementation GEOCombinedFactoid

- (GEOCombinedFactoid)initWithLabelFactoid:(id)a3 iconFactoid:(id)a4
{
  id v7;
  id v8;
  GEOCombinedFactoid *v9;
  GEOCombinedFactoid *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOCombinedFactoid;
  v9 = -[GEOCombinedFactoid init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_labelFactoid, a3);
    objc_storeStrong((id *)&v10->_iconFactoid, a4);
  }

  return v10;
}

- (NSString)title
{
  return -[GEOFactoid title](self->_labelFactoid, "title");
}

- (double)value
{
  double result;

  -[GEOFactoid value](self->_labelFactoid, "value");
  return result;
}

- (NSString)unstructuredValue
{
  return -[GEOFactoid unstructuredValue](self->_labelFactoid, "unstructuredValue");
}

- (int)semantic
{
  return -[GEOFactoid semantic](self->_labelFactoid, "semantic");
}

- (int)unitType
{
  return -[GEOFactoid unitType](self->_labelFactoid, "unitType");
}

- (BOOL)shouldUseStructuredData
{
  return -[GEOFactoid shouldUseStructuredData](self->_labelFactoid, "shouldUseStructuredData");
}

- (NSString)symbolName
{
  return -[GEOFactoid symbolName](self->_iconFactoid, "symbolName");
}

- (GEOMapItemIdentifier)placeIdentifier
{
  return -[GEOFactoid placeIdentifier](self->_labelFactoid, "placeIdentifier");
}

- (BOOL)canBeDisplayedInPlaceSummary
{
  return -[GEOFactoid canBeDisplayedInPlaceSummary](self->_labelFactoid, "canBeDisplayedInPlaceSummary");
}

- (GEOColor)color
{
  return -[GEOFactoid color](self->_labelFactoid, "color");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconFactoid, 0);
  objc_storeStrong((id *)&self->_labelFactoid, 0);
}

@end
