@implementation NSObserverKeyPath

- (void)_receiveBox:(id)a3
{
  uint64_t v5;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*((_DWORD *)a3 + 6) == 1)
  {
    if (objc_msgSend(a3, "_isToManyChangeInformation"))
    {
      v5 = objc_msgSend(*((id *)a3 + 1), "_toManyPropertyType");
      switch(v5)
      {
        case 2:
          objc_msgSend(*((id *)a3 + 1), "applyChangesToOrderedSet:", -[NSBoundKeyPath mutableOrderedSetValue](self, "mutableOrderedSetValue"));
          break;
        case 1:
          objc_msgSend(*((id *)a3 + 1), "applyChangesToArray:", -[NSBoundKeyPath mutableArrayValue](self, "mutableArrayValue"));
          break;
        case 0:
          objc_msgSend(*((id *)a3 + 1), "applyChangesToSet:", -[NSBoundKeyPath mutableSetValue](self, "mutableSetValue"));
          break;
      }
    }
    else
    {
      -[NSBoundKeyPath setValue:](self, "setValue:", *((_QWORD *)a3 + 1));
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)NSObserverKeyPath;
  -[NSObserverKeyPath _receiveBox:](&v6, sel__receiveBox_, a3);
}

- (void)setObservation:(id)a3
{
  objc_msgSend(-[NSBoundKeyPath rootObject](self, "rootObject"), "setObservation:forObservingKeyPath:", a3, self);
}

- (void)finishObserving
{
  -[NSObserverKeyPath setObservation:](self, "setObservation:", 0);
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> @observer(%@)"), objc_opt_class(), self, self->super._keyPath);
}

@end
