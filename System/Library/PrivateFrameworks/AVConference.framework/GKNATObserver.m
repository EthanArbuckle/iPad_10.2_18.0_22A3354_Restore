@implementation GKNATObserver

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_class *v4;

  v4 = (objc_class *)a1;
  if ((id)objc_opt_self() == a1)
    v4 = (objc_class *)objc_opt_self();
  return NSAllocateObject(v4, 0, a3);
}

- (GKNATObserver)initWithOptions:(id)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)GKNATObserver;
  -[GKNATObserver doesNotRecognizeSelector:](&v4, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (void)setDelegate:(id)a3
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)GKNATObserver;
  -[GKNATObserver doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (GKNATObserverDelegate)delegate
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)GKNATObserver;
  -[GKNATObserver doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (int)currentNATType
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)GKNATObserver;
  -[GKNATObserver doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (void)shouldTryNATCheck
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)GKNATObserver;
  -[GKNATObserver doesNotRecognizeSelector:](&v2, sel_doesNotRecognizeSelector_, a2);
}

@end
