@implementation PatternPlayerBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternID, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_destroyWeak((id *)&self->_engine);
}

- (NSString)patternID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)needsResetForAction:(unsigned __int8)a3
{
  int previousAction;

  previousAction = self->_previousAction;
  self->_previousAction = a3;
  if (previousAction == 2)
    return a3 == 2;
  else
    return previousAction != 1;
}

- (CHHapticEngine)engine
{
  return (CHHapticEngine *)objc_loadWeakRetained((id *)&self->_engine);
}

- (void)setEngine:(id)a3
{
  objc_storeWeak((id *)&self->_engine, a3);
}

- (double)patternDuration
{
  return self->_patternDuration;
}

@end
