@implementation GCMouseInputState

- (GCButtonElement)primaryButton
{
  return (GCButtonElement *)-[_GCDevicePhysicalInputFacade objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("Primary Button"));
}

- (GCButtonElement)secondaryButton
{
  return (GCButtonElement *)-[_GCDevicePhysicalInputFacade objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("Secondary Button"));
}

- (GCButtonElement)thirdButton
{
  return (GCButtonElement *)-[_GCDevicePhysicalInputFacade objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("Third Button"));
}

- (GCCursorElement)cursor
{
  return (GCCursorElement *)-[_GCDevicePhysicalInputFacade objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("Cursor"));
}

- (id)scroll
{
  return -[_GCDevicePhysicalInputFacade objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("Scroll Wheel"));
}

- (GCDirectionPadElement)scrollWheel
{
  return self->_scrollWheel;
}

- (NSArray)auxiliaryButtons
{
  return self->_auxiliaryButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryButtons, 0);
  objc_storeStrong((id *)&self->_scrollWheel, 0);
}

@end
