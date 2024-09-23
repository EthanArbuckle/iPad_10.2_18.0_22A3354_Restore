@implementation _ATXChronoServicesProviderRecord

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CHSWidget)widget
{
  return self->_widget;
}

- (void)setWidget:(id)a3
{
  objc_storeStrong((id *)&self->_widget, a3);
}

- (BSInvalidatable)widgetHandle
{
  return self->_widgetHandle;
}

- (void)setWidgetHandle:(id)a3
{
  objc_storeStrong((id *)&self->_widgetHandle, a3);
}

- (NSString)suggestedStackId
{
  return self->_suggestedStackId;
}

- (void)setSuggestedStackId:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedStackId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedStackId, 0);
  objc_storeStrong((id *)&self->_widgetHandle, 0);
  objc_storeStrong((id *)&self->_widget, 0);
}

@end
