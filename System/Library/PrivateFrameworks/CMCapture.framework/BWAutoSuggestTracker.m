@implementation BWAutoSuggestTracker

- (BWAutoSuggestTracker)init
{
  BWAutoSuggestTracker *v2;
  BWAutoSuggestTracker *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWAutoSuggestTracker;
  v2 = -[BWAutoSuggestTracker init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_objectType = 0;
    v2->_combinedTrackerID = 0;
    v2->_validObjectCounter = 0;
    v2->_rect.origin = 0u;
    v2->_rect.size = 0u;
    v2->_centersIn = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_objectAreaIn = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_centerVx = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_centerVy = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_centerDx = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_centerDy = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWAutoSuggestTracker;
  -[BWAutoSuggestTracker dealloc](&v3, sel_dealloc);
}

- (int)objectType
{
  return self->_objectType;
}

- (void)setObjectType:(int)a3
{
  self->_objectType = a3;
}

- (int)trackerID
{
  return self->_trackerID;
}

- (void)setTrackerID:(int)a3
{
  self->_trackerID = a3;
}

- (int64_t)combinedTrackerID
{
  return self->_combinedTrackerID;
}

- (void)setCombinedTrackerID:(int64_t)a3
{
  self->_combinedTrackerID = a3;
}

- (unsigned)confidenceLevel
{
  return self->_confidenceLevel;
}

- (void)setConfidenceLevel:(unsigned int)a3
{
  self->_confidenceLevel = a3;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (int)validObjectCounter
{
  return self->_validObjectCounter;
}

- (void)setValidObjectCounter:(int)a3
{
  self->_validObjectCounter = a3;
}

- (NSMutableArray)centersIn
{
  return self->_centersIn;
}

- (void)setCentersIn:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSMutableArray)objectAreaIn
{
  return self->_objectAreaIn;
}

- (void)setObjectAreaIn:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSMutableArray)centerVx
{
  return self->_centerVx;
}

- (void)setCenterVx:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSMutableArray)centerVy
{
  return self->_centerVy;
}

- (void)setCenterVy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSMutableArray)centerDx
{
  return self->_centerDx;
}

- (void)setCenterDx:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSMutableArray)centerDy
{
  return self->_centerDy;
}

- (void)setCenterDy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
