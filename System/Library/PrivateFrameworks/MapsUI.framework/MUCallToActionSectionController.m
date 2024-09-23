@implementation MUCallToActionSectionController

- (MUPlaceCallToActionSectionControllerDelegate)callToActionDelegate
{
  return (MUPlaceCallToActionSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_callToActionDelegate);
}

- (void)setCallToActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_callToActionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_callToActionDelegate);
}

@end
