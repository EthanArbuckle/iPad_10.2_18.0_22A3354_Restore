@implementation CHOrderedStrokeGroup

- (CHOrderedStrokeGroup)initWithAncestorIdentifier:(int64_t)a3 strokeIdentifiers:(id)a4 firstStrokeIdentifier:(id)a5 lastStrokeIdentifier:(id)a6 bounds:(CGRect)a7 classification:(int64_t)a8 groupingConfidence:(double)a9 strategyIdentifier:(id)a10 firstStrokeOrigin:(CGPoint)a11 orderedStrokeIdentifiers:(id)a12
{
  double y;
  double x;
  double height;
  double width;
  double v22;
  double v23;
  id v26;
  CHOrderedStrokeGroup *v27;
  CHOrderedStrokeGroup *v28;
  objc_super v30;

  y = a11.y;
  x = a11.x;
  height = a7.size.height;
  width = a7.size.width;
  v22 = a7.origin.y;
  v23 = a7.origin.x;
  v26 = a12;
  v30.receiver = self;
  v30.super_class = (Class)CHOrderedStrokeGroup;
  v27 = -[CHStrokeGroup initWithAncestorIdentifier:strokeIdentifiers:firstStrokeIdentifier:lastStrokeIdentifier:bounds:classification:groupingConfidence:strategyIdentifier:firstStrokeOrigin:](&v30, sel_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_, a3, a4, a5, a6, a8, a10, v23, v22, width, height, a9, x, y);
  v28 = v27;
  if (v27)
    objc_storeStrong((id *)&v27->_orderedStrokeIdentifiers, a12);

  return v28;
}

- (CHOrderedStrokeGroup)initWithUniqueIdentifier:(int64_t)a3 ancestorIdentifier:(int64_t)a4 strokeIdentifiers:(id)a5 firstStrokeIdentifier:(id)a6 lastStrokeIdentifier:(id)a7 bounds:(CGRect)a8 classification:(int64_t)a9 groupingConfidence:(double)a10 strategyIdentifier:(id)a11 firstStrokeOrigin:(CGPoint)a12 orderedStrokeIdentifiers:(id)a13
{
  double y;
  double x;
  double height;
  double width;
  double v23;
  double v24;
  id v27;
  CHOrderedStrokeGroup *v28;
  CHOrderedStrokeGroup *v29;
  objc_super v31;

  y = a12.y;
  x = a12.x;
  height = a8.size.height;
  width = a8.size.width;
  v23 = a8.origin.y;
  v24 = a8.origin.x;
  v27 = a13;
  v31.receiver = self;
  v31.super_class = (Class)CHOrderedStrokeGroup;
  v28 = -[CHStrokeGroup initWithUniqueIdentifier:ancestorIdentifier:strokeIdentifiers:firstStrokeIdentifier:lastStrokeIdentifier:bounds:classification:groupingConfidence:strategyIdentifier:firstStrokeOrigin:](&v31, sel_initWithUniqueIdentifier_ancestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_, a3, a4, a5, a6, a7, a9, v24, v23, width, height, a10, x, y, a11);
  v29 = v28;
  if (v28)
    objc_storeStrong((id *)&v28->_orderedStrokeIdentifiers, a13);

  return v29;
}

- (NSArray)orderedStrokeIdentifiers
{
  return self->_orderedStrokeIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedStrokeIdentifiers, 0);
}

@end
