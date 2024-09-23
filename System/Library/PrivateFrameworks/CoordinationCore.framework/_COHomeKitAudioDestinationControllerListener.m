@implementation _COHomeKitAudioDestinationControllerListener

- (id)initWitAccessory:(id)a3 home:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  _COHomeKitAudioDestinationControllerListener *v12;
  id *p_isa;
  NSObject *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_COHomeKitAudioDestinationControllerListener;
  v12 = -[_COHomeKitAudioDestinationControllerListener init](&v16, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeStrong(p_isa + 1, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_msgSend(p_isa[1], "setDelegate:", p_isa);
    COCoreLogForCategory(1);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[_COHomeKitAudioDestinationControllerListener initWitAccessory:home:delegate:].cold.1();

  }
  return p_isa;
}

- (void)accessoryDidUpdateAudioDestinationController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_COHomeKitAudioDestinationControllerListener delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_COHomeKitAudioDestinationControllerListener home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioDestinationControllerDidUpdateForAccessory:inHome:", v6, v5);

  }
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMHome)home
{
  return self->_home;
}

- (_COHomeKitAudioDestinationControllerListenerDelegate)delegate
{
  return (_COHomeKitAudioDestinationControllerListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

- (void)initWitAccessory:home:delegate:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  _os_log_debug_impl(&dword_215E92000, v0, OS_LOG_TYPE_DEBUG, "%p listening for audio destination controller on %@", v1, 0x16u);
}

@end
