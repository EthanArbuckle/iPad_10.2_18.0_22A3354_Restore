@implementation CNContactContentViewControllerConfiguration

- (CNContactContentViewControllerConfiguration)init
{
  return (CNContactContentViewControllerConfiguration *)-[CNContactContentViewControllerConfiguration initForOutOfProcess:](self, "initForOutOfProcess:", 0);
}

- (id)initForOutOfProcess:(BOOL)a3
{
  CNContactContentViewControllerConfiguration *v4;
  CNContactContentViewControllerConfiguration *v5;
  uint64_t v6;
  NSArray *displayedProperties;
  uint64_t v8;
  CNContactFormatter *contactFormatter;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNContactContentViewControllerConfiguration;
  v4 = -[CNContactContentViewControllerConfiguration init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_isOutOfProcess = a3;
    +[CNContactView allCardProperties](CNContactView, "allCardProperties");
    v6 = objc_claimAutoreleasedReturnValue();
    displayedProperties = v5->_displayedProperties;
    v5->_displayedProperties = (NSArray *)v6;

    v5->_allowsEditing = 1;
    v5->_allowsActions = 1;
    *(_DWORD *)&v5->_allowsCardActions = 16843009;
    *(_DWORD *)&v5->_allowsSendMessage = 16777217;
    v5->_allowsSettingLinkedContactsAsPreferred = 1;
    *(_DWORD *)&v5->_allowsActionsModel = 65793;
    *(_WORD *)&v5->_showsInlineActions = 257;
    v5->_showsGroupMembership = 1;
    *(_WORD *)&v5->_hideCardActions = 0;
    v5->_showContactBlockingFirst = 0;
    objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatter");
    v8 = objc_claimAutoreleasedReturnValue();
    contactFormatter = v5->_contactFormatter;
    v5->_contactFormatter = (CNContactFormatter *)v8;

  }
  return v5;
}

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  id v4;
  CNContactStore *v5;
  CNContactStore *v6;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C972A0]);
    if (objc_msgSend(MEMORY[0x1E0C97200], "suggestionsEnabled"))
      objc_msgSend(v4, "setIncludeSuggestedContacts:", 1);
    v5 = (CNContactStore *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v4);
    v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (BOOL)isOutOfProcess
{
  return self->_isOutOfProcess;
}

- (void)setIsOutOfProcess:(BOOL)a3
{
  self->_isOutOfProcess = a3;
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (NSArray)displayedProperties
{
  return self->_displayedProperties;
}

- (void)setDisplayedProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (BOOL)alwaysEditing
{
  return self->_alwaysEditing;
}

- (void)setAlwaysEditing:(BOOL)a3
{
  self->_alwaysEditing = a3;
}

- (BOOL)allowsActions
{
  return self->_allowsActions;
}

- (void)setAllowsActions:(BOOL)a3
{
  self->_allowsActions = a3;
}

- (BOOL)allowsPropertyActions
{
  return self->_allowsPropertyActions;
}

- (void)setAllowsPropertyActions:(BOOL)a3
{
  self->_allowsPropertyActions = a3;
}

- (BOOL)allowsCardActions
{
  return self->_allowsCardActions;
}

- (void)setAllowsCardActions:(BOOL)a3
{
  self->_allowsCardActions = a3;
}

- (BOOL)allowsConferencing
{
  return self->_allowsConferencing;
}

- (void)setAllowsConferencing:(BOOL)a3
{
  self->_allowsConferencing = a3;
}

- (BOOL)allowsSharing
{
  return self->_allowsSharing;
}

- (void)setAllowsSharing:(BOOL)a3
{
  self->_allowsSharing = a3;
}

- (BOOL)allowsAddToFavorites
{
  return self->_allowsAddToFavorites;
}

- (void)setAllowsAddToFavorites:(BOOL)a3
{
  self->_allowsAddToFavorites = a3;
}

- (BOOL)allowsSendMessage
{
  return self->_allowsSendMessage;
}

- (void)setAllowsSendMessage:(BOOL)a3
{
  self->_allowsSendMessage = a3;
}

- (BOOL)allowsContactBlocking
{
  return self->_allowsContactBlocking;
}

- (void)setAllowsContactBlocking:(BOOL)a3
{
  self->_allowsContactBlocking = a3;
}

- (BOOL)allowsContactBlockingAndReporting
{
  return self->_allowsContactBlockingAndReporting;
}

- (void)setAllowsContactBlockingAndReporting:(BOOL)a3
{
  self->_allowsContactBlockingAndReporting = a3;
}

- (BOOL)allowsAddingToAddressBook
{
  return self->_allowsAddingToAddressBook;
}

- (void)setAllowsAddingToAddressBook:(BOOL)a3
{
  self->_allowsAddingToAddressBook = a3;
}

- (BOOL)shouldShowLinkedContacts
{
  return self->_shouldShowLinkedContacts;
}

- (void)setShouldShowLinkedContacts:(BOOL)a3
{
  self->_shouldShowLinkedContacts = a3;
}

- (BOOL)allowsSettingLinkedContactsAsPreferred
{
  return self->_allowsSettingLinkedContactsAsPreferred;
}

- (void)setAllowsSettingLinkedContactsAsPreferred:(BOOL)a3
{
  self->_allowsSettingLinkedContactsAsPreferred = a3;
}

- (BOOL)allowsDeletion
{
  return self->_allowsDeletion;
}

- (void)setAllowsDeletion:(BOOL)a3
{
  self->_allowsDeletion = a3;
}

- (BOOL)allowsActionsModel
{
  return self->_allowsActionsModel;
}

- (void)setAllowsActionsModel:(BOOL)a3
{
  self->_allowsActionsModel = a3;
}

- (BOOL)allowsDisplayModePickerActions
{
  return self->_allowsDisplayModePickerActions;
}

- (void)setAllowsDisplayModePickerActions:(BOOL)a3
{
  self->_allowsDisplayModePickerActions = a3;
}

- (BOOL)allowsEditPhoto
{
  return self->_allowsEditPhoto;
}

- (void)setAllowsEditPhoto:(BOOL)a3
{
  self->_allowsEditPhoto = a3;
}

- (BOOL)allowsNamePicking
{
  return self->_allowsNamePicking;
}

- (void)setAllowsNamePicking:(BOOL)a3
{
  self->_allowsNamePicking = a3;
}

- (BOOL)showsInlineActions
{
  return self->_showsInlineActions;
}

- (void)setShowsInlineActions:(BOOL)a3
{
  self->_showsInlineActions = a3;
}

- (BOOL)showsSharedProfile
{
  return self->_showsSharedProfile;
}

- (void)setShowsSharedProfile:(BOOL)a3
{
  self->_showsSharedProfile = a3;
}

- (BOOL)showsGroupMembership
{
  return self->_showsGroupMembership;
}

- (void)setShowsGroupMembership:(BOOL)a3
{
  self->_showsGroupMembership = a3;
}

- (BOOL)ignoresParentalRestrictions
{
  return self->_ignoresParentalRestrictions;
}

- (void)setIgnoresParentalRestrictions:(BOOL)a3
{
  self->_ignoresParentalRestrictions = a3;
}

- (BOOL)editingProposedInformation
{
  return self->_editingProposedInformation;
}

- (void)setEditingProposedInformation:(BOOL)a3
{
  self->_editingProposedInformation = a3;
}

- (BOOL)hideCardActions
{
  return self->_hideCardActions;
}

- (void)setHideCardActions:(BOOL)a3
{
  self->_hideCardActions = a3;
}

- (BOOL)isMailVIP
{
  return self->_isMailVIP;
}

- (void)setIsMailVIP:(BOOL)a3
{
  self->_isMailVIP = a3;
}

- (BOOL)showContactBlockingFirst
{
  return self->_showContactBlockingFirst;
}

- (void)setShowContactBlockingFirst:(BOOL)a3
{
  self->_showContactBlockingFirst = a3;
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (void)setAlternateName:(id)a3
{
  objc_storeStrong((id *)&self->_alternateName, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)warningMessage
{
  return self->_warningMessage;
}

- (void)setWarningMessage:(id)a3
{
  objc_storeStrong((id *)&self->_warningMessage, a3);
}

- (NSString)importantMessage
{
  return self->_importantMessage;
}

- (void)setImportantMessage:(id)a3
{
  objc_storeStrong((id *)&self->_importantMessage, a3);
}

- (NSAttributedString)verifiedInfoMessage
{
  return self->_verifiedInfoMessage;
}

- (void)setVerifiedInfoMessage:(id)a3
{
  objc_storeStrong((id *)&self->_verifiedInfoMessage, a3);
}

- (NSString)primaryProperty
{
  return self->_primaryProperty;
}

- (void)setPrimaryProperty:(id)a3
{
  objc_storeStrong((id *)&self->_primaryProperty, a3);
}

- (UIView)personHeaderView
{
  return self->_personHeaderView;
}

- (void)setPersonHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_personHeaderView, a3);
}

- (UIViewController)personHeaderViewController
{
  return self->_personHeaderViewController;
}

- (void)setPersonHeaderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_personHeaderViewController, a3);
}

- (NSArray)highlightedProperties
{
  return self->_highlightedProperties;
}

- (void)setHighlightedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedProperties, a3);
}

- (BOOL)highlightedPropertyImportant
{
  return self->_highlightedPropertyImportant;
}

- (void)setHighlightedPropertyImportant:(BOOL)a3
{
  self->_highlightedPropertyImportant = a3;
}

- (CNPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (NSDictionary)linkedPoliciesByContactIdentifier
{
  return self->_linkedPoliciesByContactIdentifier;
}

- (void)setLinkedPoliciesByContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, a3);
}

- (BOOL)allowsEditInApp
{
  return self->_allowsEditInApp;
}

- (void)setAllowsEditInApp:(BOOL)a3
{
  self->_allowsEditInApp = a3;
}

- (BOOL)shouldDrawNavigationBar
{
  return self->_shouldDrawNavigationBar;
}

- (void)setShouldDrawNavigationBar:(BOOL)a3
{
  self->_shouldDrawNavigationBar = a3;
}

- (NSString)initialPrompt
{
  return self->_initialPrompt;
}

- (void)setInitialPrompt:(id)a3
{
  objc_storeStrong((id *)&self->_initialPrompt, a3);
}

- (BOOL)layoutPositionallyAfterNavBar
{
  return self->_layoutPositionallyAfterNavBar;
}

- (void)setLayoutPositionallyAfterNavBar:(BOOL)a3
{
  self->_layoutPositionallyAfterNavBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialPrompt, 0);
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_highlightedProperties, 0);
  objc_storeStrong((id *)&self->_personHeaderViewController, 0);
  objc_storeStrong((id *)&self->_personHeaderView, 0);
  objc_storeStrong((id *)&self->_primaryProperty, 0);
  objc_storeStrong((id *)&self->_verifiedInfoMessage, 0);
  objc_storeStrong((id *)&self->_importantMessage, 0);
  objc_storeStrong((id *)&self->_warningMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);
  objc_storeStrong((id *)&self->_displayedProperties, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
}

@end
