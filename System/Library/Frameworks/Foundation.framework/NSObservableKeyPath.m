@implementation NSObservableKeyPath

- (id)addObserver:(id)a3
{
  return (id)objc_msgSend(-[NSBoundKeyPath rootObject](self, "rootObject"), "addObserver:forObservableKeyPath:", a3, self);
}

- (void)removeObservation:(id)a3
{
  objc_msgSend(a3, "remove");
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> @observable(%@)"), objc_opt_class(), self, self->super._keyPath);
}

- (NSObservable)changes
{
  return (NSObservable *)+[NSBoundKeyPath newKeyPathWithRootObject:keyPathString:](_NSObservableKeyPathChangeAdaptor, "newKeyPathWithRootObject:keyPathString:", -[NSBoundKeyPath rootObject](self, "rootObject"), self->super._keyPath);
}

- (BOOL)_wantsChanges
{
  return 0;
}

@end
