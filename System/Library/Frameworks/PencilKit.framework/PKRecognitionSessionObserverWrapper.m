@implementation PKRecognitionSessionObserverWrapper

- (void)recognitionSessionDidUpdateRecognitionResult:(id)a3
{
  id v4;
  unsigned __int8 v5;
  NSObject *WeakRetained;
  uint8_t v7[16];

  v4 = a3;
  v5 = atomic_load((unsigned __int8 *)&self->_deactivated);
  if ((v5 & 1) != 0)
  {
    WeakRetained = os_log_create("com.apple.pencilkit", "RecognitionManager");
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1BE213000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Prevented session observer from triggering after deactivation.", v7, 2u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_realObserver);
    -[NSObject recognitionSessionDidUpdateRecognitionResult:](WeakRetained, "recognitionSessionDidUpdateRecognitionResult:", v4);
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_realObserver);
}

@end
