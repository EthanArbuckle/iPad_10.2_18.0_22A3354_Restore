@implementation DACLifecycleManagerMediator

- (void)activityListChanged:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "activityListChanged:", v6);

}

- (void)activatedAssertionForActivity:(id)a3 withChangeMarker:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "activatedAssertionForActivity:withChangeMarker:", v9, v6);

}

- (void)roleChanged:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "roleChanged:", v6);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
}

@end
